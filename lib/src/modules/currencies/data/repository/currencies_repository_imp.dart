import 'package:dartz/dartz.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/faliure.dart';
import '../../../../core/network/network_checker.dart';

import '../../domain/repository/base_currencies_repo.dart';
import '../datasource/local_datasource.dart';
import '../datasource/remote_datasource.dart';
import '../model/converter_model.dart';
import '../model/country_currency_model.dart';

class CurrenciesRepositoryImp extends BaseCurrenciesRepository {
  final DioRemoteDataSource dioRemoteDataSource;

  final NetworkChecker networkChecker;
  final SharedPefLocalDataSourceImp sharedPefLocalDataSourceImp;

  CurrenciesRepositoryImp(
      {required this.dioRemoteDataSource,
      required this.networkChecker,
      required this.sharedPefLocalDataSourceImp});
  @override
  Future<Either<Failure, List<CountryCurrencyModel>>>
      fetchAllCountriesCurrencyFlagsImp() async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result =
            await dioRemoteDataSource.fetchAllCountriesCurrencyFlags();
        await sharedPefLocalDataSourceImp
            .cachedCountryCurrencyListLocal(result);
        return Right(result);
      } on ExceptionService {
        return Left(FailureService());
      }
    } else {
      try {
        final cachedData =
            await sharedPefLocalDataSourceImp.getCountryCurrencyListLocal();
        return Right(cachedData);
      } on ExceptionEmptyCache {
        return Left(FailureEmptyCache());
      }
    }
  }

  @override
  Future<Either<Failure, ConverterModel>> converterTwoCurrenciesImp(
      {required String firstCurrencyId,
      required String secondCurrencyId}) async {
    try {
      final result = await dioRemoteDataSource.converterTwoCurrencies(
          firstCurrencyId, secondCurrencyId);
      return Right(result);
    } on ExceptionService {
      return Left(FailureService());
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>>
      historicalCurrenciesImp() async {
    try {
      final result = await dioRemoteDataSource.historicalCurrencies();
      return Right(result);
    } on ExceptionService {
      return Left(FailureService());
    }
  }

  @override
  List<Object?> get props => [];
}
