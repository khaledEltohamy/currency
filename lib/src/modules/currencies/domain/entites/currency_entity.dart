import 'package:equatable/equatable.dart';

abstract class ResponseCurrencyEntity extends Equatable {
  final MapCurrencyEntity currencies;

  const ResponseCurrencyEntity({required this.currencies});
}

abstract class MapCurrencyEntity extends Equatable {
  final List<CurrencyEntity> currencyMap;

  const MapCurrencyEntity({required this.currencyMap});
}

abstract class CurrencyEntity extends Equatable {
  final String currencyName;
  final String currencySymbol;
  final String id;

  const CurrencyEntity({
    required this.currencyName,
    required this.currencySymbol,
    required this.id,
  });
}
