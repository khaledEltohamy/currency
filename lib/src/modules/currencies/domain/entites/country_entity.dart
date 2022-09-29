import 'package:equatable/equatable.dart';

abstract class ResponseCountriesEntity extends Equatable {
  final MapCountriesEntity mapCountriesEntity;

  const ResponseCountriesEntity({required this.mapCountriesEntity});
}

abstract class MapCountriesEntity extends Equatable {
  final List<CountryEntity> countriesMap;

  const MapCountriesEntity({required this.countriesMap});
}

abstract class CountryEntity extends Equatable {
  final String alpha3;
  final String currencyId;
  final String currencyName;
  final String currencySymbol;
  final String id;
  final String name;

  const CountryEntity(
      {required this.alpha3,
      required this.currencyId,
      required this.currencyName,
      required this.currencySymbol,
      required this.id,
      required this.name});
}
