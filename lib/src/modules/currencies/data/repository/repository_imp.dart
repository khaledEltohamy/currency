import 'package:currency_converter_app/src/modules/currencies/data/datasource/remote/base_remote_datasource.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/faliure.dart';
import '../../../../core/network/network_checker.dart';

import '../../domain/model/currency_converter_model.dart';
import '../../domain/model/historical_currencies_model.dart';
import '../../domain/model/supported_currencies_model.dart';
import '../../domain/repository/base_repository.dart';
import '../../domain/usecase/convert_currencies_usecase.dart';
import '../datasource/local/base_local_datasource.dart';
import '../entities/supported_currencies_entity.dart';


// ignore: must_be_immutable
class RepositoryImp extends BaseRepository {
  final BaseRemoteDataSource remoteDataSource;
  final NetWorkInfo networkChecker;
  final BaseLocalDataSource localDataSource;

  RepositoryImp(
      {required this.remoteDataSource,
      required this.networkChecker,
      required this.localDataSource});


  ResponseSupportedCurrenciesEntity? localCurrencyList;
  @override
  Future<Either<Failure, ResponseSupportedCurrenciesModel>>fetchsupportedCurrencies() async {
      try {
        localCurrencyList = 
         await localDataSource.getSupportedCurrenciesModelListLocal();
         return Right(ResponseSupportedCurrenciesModel(supportedCurrencies: localCurrencyList!.transform().supportedCurrencies));
        } on ExceptionEmptyCache {
      if (await networkChecker.isDeviceConnected) {
      try {
        final remoteCurrencyList = await remoteDataSource.fetchsupportedCurrencies();
        await localDataSource.cachedSupportedCurrenciesModelListLocal(remoteCurrencyList);
        return Right(remoteCurrencyList.transform());
      } on ExceptionService {
        return Left(FailureService());
      }
      } 
      else {
       return Left(FailureOffline());
      }
        }
 
  }

  @override
  Future<Either<Failure, CurrencyConverterModel>> converterTwoCurrencies(ConvertCurrenciesUseCaseParams params) async {
    if (await networkChecker.isDeviceConnected) {
    try {
      final result = await remoteDataSource.converterTwoCurrencies(params.from, params.to , params.amount);
      return Right(result.transform());
    } on ExceptionService {
      return Left(FailureService());
    }}else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, ResponseHistoricalCurrenciesModel>> historicalCurrencies() async {
   if (await networkChecker.isDeviceConnected) {
    try {
      final result = await remoteDataSource.historicalCurrencies();
      return Right(result.transform());
    } on ExceptionService {
      return Left(FailureService());
    }}else {
      return Left(FailureOffline());
    }
  }

  @override
  List<Object?> get props => [];
}
