import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/faliure.dart';
import '../../data/model/converter_model.dart';
import '../../data/model/country_currency_model.dart';

abstract class BaseCurrenciesRepository extends Equatable {
  Future<Either<Failure, List<CountryCurrencyModel>>>
      fetchAllCountriesCurrencyFlagsImp();
  Future<Either<Failure, ConverterModel>> converterTwoCurrenciesImp(
      {required String firstCurrencyId, required String secondCurrencyId});
  Future<Either<Failure, List<Map<String, dynamic>>>> historicalCurrenciesImp();
}
