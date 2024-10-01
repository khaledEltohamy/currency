import 'package:currency_converter_app/src/core/constants/page_dimensions/app_size.dart';
import 'package:currency_converter_app/src/core/constants/page_dimensions/separator.dart';
import 'package:currency_converter_app/src/core/constants/strings/app_strings.dart';
import 'package:currency_converter_app/src/core/widget/loading/loading_circular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/model/supported_currencies_model.dart';
import '../../bloc/converter_currencies_bloc/converter_currencies_bloc.dart';
import '../../cubit/converter_list_cubit/converter_list_cubit.dart';
import '../../../../../core/widget/cards/currency_card.dart';

class ConverterList extends StatefulWidget {
   const ConverterList({super.key});

  @override
  State<ConverterList> createState() => _ConverterListState();
}

class _ConverterListState extends State<ConverterList> {
  late TextEditingController controller;
  late FocusNode foucedNode ;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    controller = TextEditingController();
    foucedNode = FocusNode();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var list = context.watch<ConverterListCubit>().state;
    return SizedBox(
      height: list.isEmpty ? 100 : 340,
      child: list.isEmpty ? _emptySection() : _successConverterState(context, list),
    );
  }

  Widget _emptySection()=> const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              SizedBox(width: 160, height: AppSize.cardMinHeight, child: Card()),
              SizedBox(width: 160, height: AppSize.cardMinHeight, child: Card()),
            ],
          );

  _successConverterState(BuildContext context, List<SupportedCurrenciesModel> supportedCurrenciesList) =>
      Column(
        children: [
          SizedBox(
            height: AppSize.cardMaxHeight,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: supportedCurrenciesList.length,
              itemBuilder: (context, index) => CurrencyCard(
                model: supportedCurrenciesList[index],
                isadded: false,
              ),
            ),
          ),
          Form(
            key: formKey,
            child: TextFormField(
              key: const Key(AppString.amountFormKey),
              controller: controller,
              keyboardType: TextInputType.number, 
              decoration:InputDecoration(
                hintText: "Amout",
                hintStyle: TextStyle(color: Colors.grey.shade400),
                    contentPadding:
             const  EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
                    enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
               borderSide: BorderSide(color: Colors.grey.shade400) ),
                    focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade600)
                    ),
            )),
          ),
          supportedCurrenciesList.length >= 2 ? _converterButton(context, supportedCurrenciesList): Container(),
        ].toAddSeparator(element: const SizedBox(height: 16)).toList(),
      );

 Widget _converterButton(BuildContext context,List<SupportedCurrenciesModel> countryCurrencyList) =>
      Container(
        width: 350,
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Center(
          child: Column(
            children: [
              RawMaterialButton(
                key: const Key(AppString.buttonFormKey),
                fillColor: Colors.grey.shade300,
                constraints: const BoxConstraints(minWidth: 200 , maxWidth: 280 , minHeight: 46 , maxHeight: 54),
                  onPressed: () { 
                    FocusManager.instance.primaryFocus?.unfocus();
                    final amountValue = controller.text.isEmpty || controller.text == "0" ? "1" : controller.text ; 
                    if (controller.text.isEmpty || controller.text == "0"){
                   ScaffoldMessenger.of(context)
                   .showSnackBar(const SnackBar(content: Text(AppString.amountValueNotRequired)));
                  }
                    BlocProvider.of<ConverterCurrenciesBloc>(context)
                      .add( GetConverterCurrencies(
                        from: countryCurrencyList[0].isoCurrencyCode! 
                        , to: countryCurrencyList[1].isoCurrencyCode!
                        , amount: double.parse(amountValue)
                         ));},
                  child: const Text("Convert")),
             const SizedBox(height: 16),
              _resultConverter(),
            ],
          ),
        ),
      );

 Widget _resultConverter() =>
      BlocBuilder<ConverterCurrenciesBloc, ConverterCurrenciesState>(
          builder: ((context, state) {
        if (state is CurrenciesConverterLoading) {
          return const LoadingCircularWidget();
        }
        if (state is CurrenciesConverterSuccess) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey.shade300)),
            width: double.infinity,
              padding: const EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Row(
                      children: [
                    Text(
                      state.converterModel.query.from),
                      Text("  :::  ${state.converterModel.query.amount}"),
                      const SizedBox(width: 24),
                      const  Icon(Icons.arrow_forward , color: Colors.green,),
                      const  SizedBox(width: 24),
                      Text(state.converterModel.query.to),
                      Text("  :::  ${state.converterModel.result}"),
                 
                    ],),
            
                     Text(
                      "quote :: ${state.converterModel.info.quote}"),
                  ],),
            
                
                
                      
                ],
              ));
        } else {
          return Container();
        }
      }));
}
