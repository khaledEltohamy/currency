import '../../domain/entites/country_currency_entity.dart';

class ResponseCountryCurrency extends ResponseCountryCurrencyEntity {
  const ResponseCountryCurrency({required super.countryCurrencyEntityList});

  @override
  List<Object?> get props => [];
}

class CountryCurrencyModel extends CountryCurrencyEntity {
  const CountryCurrencyModel(
      {required super.currencyId,
      required super.country_code_id,
      required super.currencyName,
      required super.countryName,
      required super.currencySymbol,
      required super.country_image_code_Id});

  factory CountryCurrencyModel.fromJson(Map<String, dynamic> map) =>
      CountryCurrencyModel(
          currencyId: map['currencyId'],
          country_code_id: map['country_code_id'],
          currencyName: map['currencyName'],
          countryName: map['countryName'],
          currencySymbol: map['currencySymbol'],
          country_image_code_Id: map['country_image_code_Id']);
  toJson() {
    return {
      "currencyId": currencyId,
      "country_code_id": country_code_id,
      "currencyName": currencyName,
      "countryName": countryName,
      "currencySymbol": currencySymbol,
      "country_image_code_Id": country_image_code_Id,
    };
  }

  @override
  List<Object?> get props => [];
}
