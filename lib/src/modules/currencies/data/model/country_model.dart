import '../../domain/entites/country_entity.dart';

class ResponseCountriesModel extends ResponseCountriesEntity {
  const ResponseCountriesModel({required super.mapCountriesEntity});
  factory ResponseCountriesModel.fromJson(Map<String, dynamic> json) =>
      ResponseCountriesModel(
          mapCountriesEntity: MapCountriesModel.fromJson(json['results']));
  @override
  List<Object?> get props => [];
}

class MapCountriesModel extends MapCountriesEntity {
  const MapCountriesModel({required super.countriesMap});

  factory MapCountriesModel.fromJson(Map<String, dynamic> json) =>
      MapCountriesModel(
          countriesMap: List<CountryEntity>.from(
              json.values.map((country) => CountryModel.fromJson(country))));
  @override
  List<Object?> get props => [];
}

class CountryModel extends CountryEntity {
  const CountryModel(
      {required super.alpha3,
      required super.currencyId,
      required super.currencyName,
      required super.currencySymbol,
      required super.id,
      required super.name});
  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
      alpha3: json['alpha3'],
      currencyId: json['currencyId'],
      currencyName: json['currencyName'],
      currencySymbol: json['currencySymbol'] ?? "",
      id: json['id'],
      name: json['name']);
  @override
  List<Object?> get props => [];
}
