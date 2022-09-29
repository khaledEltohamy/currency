import 'package:dartz/dartz.dart';
import '../../../../core/errors/faliure.dart';
import '../../data/model/converter_model.dart';
import '../../data/model/country_currency_model.dart';
import '../../data/repository/currencies_repository_imp.dart';

class CurrenciesUseCase {
  final CurrenciesRepositoryImp currenciesRepositoryImp;

  CurrenciesUseCase({required this.currenciesRepositoryImp});

  Future<Either<Failure, List<CountryCurrencyModel>>>
      callCountriesCurrenciesFlags() async =>
          currenciesRepositoryImp.fetchAllCountriesCurrencyFlagsImp();

  Future<Either<Failure, ConverterModel>> callConverter(
          {required String firstCurrencyId,
          required String secondCurrencyId}) async =>
      currenciesRepositoryImp.converterTwoCurrenciesImp(
          firstCurrencyId: firstCurrencyId, secondCurrencyId: secondCurrencyId);

  Future<Either<Failure, List<Map<String, dynamic>>>>
      callHistoricalCurrencies() async =>
          currenciesRepositoryImp.historicalCurrenciesImp();
}
