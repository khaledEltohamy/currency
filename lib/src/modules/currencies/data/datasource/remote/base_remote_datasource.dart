import 'package:equatable/equatable.dart';

import '../../entities/currency_converter_entity.dart';
import '../../entities/historical_currencies_entity.dart';
import '../../entities/supported_currencies_entity.dart';

// ignore: must_be_immutable
abstract class BaseRemoteDataSource extends Equatable {
  Future<ResponseSupportedCurrenciesEntity> fetchsupportedCurrencies();
  Future<CurrencyConverterEntity> converterTwoCurrencies(String from, String to , double amount);
  Future<ResponseHistoricalCurrenciesEntity> historicalCurrencies();

}