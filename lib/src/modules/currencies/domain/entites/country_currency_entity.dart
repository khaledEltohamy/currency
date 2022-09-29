import 'package:equatable/equatable.dart';

import '../../data/model/country_currency_model.dart';

abstract class ResponseCountryCurrencyEntity extends Equatable {
  final List<CountryCurrencyModel> countryCurrencyEntityList;

  const ResponseCountryCurrencyEntity(
      {required this.countryCurrencyEntityList});
}

abstract class CountryCurrencyEntity extends Equatable {
  final String currencyId;
  final String country_code_id;
  final String currencyName;
  final String countryName;
  final String currencySymbol;
  final String country_image_code_Id;

  const CountryCurrencyEntity(
      {required this.currencyId,
      required this.country_code_id,
      required this.currencyName,
      required this.countryName,
      required this.currencySymbol,
      required this.country_image_code_Id});
}
