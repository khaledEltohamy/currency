import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entites/country_currency_entity.dart';
import '../../bloc/converter_currencies_bloc/converter_currencies_bloc.dart';
import '../../cubit/converter_list_cubit/converter_list_cubit.dart';
import 'currency_card.dart';

class ConverterList extends StatelessWidget {
  const ConverterList({super.key});

  @override
  Widget build(BuildContext context) {
    return _converterSection(context);
  }

  Widget _converterSection(BuildContext context) {
    var list = context.watch<ConverterListCubit>().state;
    return list.isEmpty
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(width: 160, height: 80, child: Card()),
              SizedBox(width: 160, height: 80, child: Card()),
            ],
          )
        : _successConverterState(context, list);
  }

  _successConverterState(
          context, List<CountryCurrencyEntity> countryCurrencyList) =>
      Column(
        children: [
          Container(
            height: 100,
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: countryCurrencyList.length,
              itemBuilder: (context, index) => CurrencyCard(
                countryCurrencyEntity: countryCurrencyList[index],
                isadded: false,
              ),
            ),
          ),
          countryCurrencyList.length >= 2
              ? _converterButton(context, countryCurrencyList)
              : Container(),
        ],
      );

  _converterButton(BuildContext context,
          List<CountryCurrencyEntity> countryCurrencyList) =>
      Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        width: double.infinity,
        child: Center(
          child: Column(
            children: [
              OutlinedButton(
                  onPressed: () => BlocProvider.of<ConverterCurrenciesBloc>(
                          context)
                      .add(GetConverterCurrencies(
                          firstCountryCurrencyEntity: countryCurrencyList[0],
                          secondCountryCurrencyEntity: countryCurrencyList[1])),
                  child: const Text("Convert")),
              _resultConverter(),
            ],
          ),
        ),
      );

  _resultConverter() =>
      BlocBuilder<ConverterCurrenciesBloc, ConverterCurrenciesState>(
          builder: ((context, state) {
        if (state is CurrenciesConverterLoading) {
          return Container(
            width: 30,
            child: CircularProgressIndicator(),
          );
        }

        if (state is CurrenciesConverterSuccess) {
          return Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "First Currency: ${state.converterModel.firstCurrencyIdConverter}"),
                  Text(
                      "Second Currency: ${state.converterModel.secondCurrencyIdConverter}"),
                ],
              ));
        } else {
          return Container();
        }
      }));
}
