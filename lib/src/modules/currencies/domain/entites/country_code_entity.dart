import 'package:equatable/equatable.dart';

abstract class ResponseCountryCodeEntity extends Equatable {
  final List<CountryCodeEntity> countriesCodesEntity;

  const ResponseCountryCodeEntity({
    required this.countriesCodesEntity,
  });
}

abstract class CountryCodeEntity extends Equatable {
  final String code;

  const CountryCodeEntity({required this.code});
}
