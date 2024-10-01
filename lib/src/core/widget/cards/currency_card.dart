import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency_converter_app/src/core/constants/page_dimensions/separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../modules/currencies/domain/model/supported_currencies_model.dart';
import '../../../modules/currencies/presentation/cubit/converter_list_cubit/converter_list_cubit.dart';

class CurrencyCard extends StatelessWidget {
  final  SupportedCurrenciesModel model;
  final bool isadded;
  const CurrencyCard(
      {super.key, required this.model, required this.isadded});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16 , bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16) ,
       border: Border.all(color: Colors.grey.shade200)),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12 , horizontal: 12),
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
            margin: const EdgeInsets.only(left: 6),
            child: CachedNetworkImage(
              imageUrl: model.image ?? "",
              placeholder: (context, url) =>
                  const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const  SizedBox(width: 8),
                     Expanded(child: Text("${model.countryName}",style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),),
               const  SizedBox(height: 5),
                  ],
                ),
               const  SizedBox(height: 5),
               
            FittedBox(
                child: Text(
                  "Currency: ${model.currencyName}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.black),
                )),
               const SizedBox(height: 5),
                Text(
                  "Currency symbol: ${model.currencySymbol}",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: Colors.grey.shade800),
                ),
              ],
            ),
          ),
          if(isadded) const Spacer(),
          if(isadded)
               SizedBox(
                  width: 50,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () =>
                            BlocProvider.of<ConverterListCubit>(context)
                                .addIteamList(model),
                        child: Container(
                          height: 50,
                          
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: const BorderRadius.only( topRight: Radius.circular(16))),
                          child: Center(
                              child: Icon(
                            Icons.add,
                            color: Colors.green.shade800,
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () =>
                            BlocProvider.of<ConverterListCubit>(context)
                                .removeIteamList(model),
                        child: Container(
                          height: 50,
                          
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: const BorderRadius.only( bottomRight: Radius.circular(16))),
                          child: Center(
                              child: Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.red.shade300,
                          )),
                        ),
                      )
                    ],
                  ))
          
        ].toAddSeparator(element: const SizedBox(width: 12)).toList(),
      ),
    );
  }
}
