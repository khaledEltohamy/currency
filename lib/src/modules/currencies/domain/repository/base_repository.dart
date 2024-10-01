import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/faliure.dart';

import '../model/currency_converter_model.dart';
import '../model/historical_currencies_model.dart';
import '../model/supported_currencies_model.dart';
import '../usecase/convert_currencies_usecase.dart';

abstract class BaseRepository extends Equatable {
  Future<Either<Failure, ResponseSupportedCurrenciesModel>>fetchsupportedCurrencies();
  Future<Either<Failure, CurrencyConverterModel>> converterTwoCurrencies(ConvertCurrenciesUseCaseParams params);
  Future<Either<Failure, ResponseHistoricalCurrenciesModel>> historicalCurrencies();
  
}
