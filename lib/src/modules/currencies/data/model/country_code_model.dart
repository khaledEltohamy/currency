import '../../domain/entites/country_code_entity.dart';

class ResponseCountryCodeModel extends ResponseCountryCodeEntity {
  const ResponseCountryCodeModel({required super.countriesCodesEntity});
  factory ResponseCountryCodeModel.fromJson(dynamic jsonCountry) =>
      ResponseCountryCodeModel(
        countriesCodesEntity: List<CountryCodeModel>.from(jsonCountry.keys
            .map((key) => CountryCodeModel.fromJson(code: key))),
      );
  @override
  List<Object?> get props => [];
}

class CountryCodeModel extends CountryCodeEntity {
  const CountryCodeModel({required super.code});
  factory CountryCodeModel.fromJson({required String code}) =>
      CountryCodeModel(code: code);
  @override
  List<Object?> get props => [];
}
