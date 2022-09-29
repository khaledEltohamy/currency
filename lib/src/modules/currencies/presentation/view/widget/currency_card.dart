import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entites/country_currency_entity.dart';
import '../../cubit/converter_list_cubit/converter_list_cubit.dart';

class CurrencyCard extends StatelessWidget {
  final CountryCurrencyEntity countryCurrencyEntity;
  final bool isadded;
  const CurrencyCard(
      {super.key, required this.countryCurrencyEntity, required this.isadded});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            SizedBox(
              width: 4,
            ),
            Container(
              margin: EdgeInsets.only(left: 6),
              child: CachedNetworkImage(
                imageUrl: countryCurrencyEntity.country_image_code_Id,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Country: ${countryCurrencyEntity.countryName}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Currency id: ${countryCurrencyEntity.currencyId}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  FittedBox(
                      child: Text(
                    "Currency: ${countryCurrencyEntity.currencyName}",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: Colors.grey),
                  )),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Currency symbol: ${countryCurrencyEntity.currencySymbol}",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 8,
                        color: Colors.grey.shade800),
                  ),
                ],
              ),
            ),
            isadded ? Spacer() : Container(),
            isadded
                ? Container(
                    width: 50,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () =>
                              BlocProvider.of<ConverterListCubit>(context)
                                  .addIteamList(countryCurrencyEntity),
                          child: Container(
                            height: 50,
                            color: Colors.grey.shade400,
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
                                  .removeIteamList(countryCurrencyEntity),
                          child: Container(
                            height: 50,
                            color: Colors.grey.shade200,
                            child: Center(
                                child: Icon(
                              Icons.remove,
                              color: Colors.red.shade800,
                            )),
                          ),
                        )
                      ],
                    ))
                : Container(),
          ],
        ),
      ),
    );
  }
}
