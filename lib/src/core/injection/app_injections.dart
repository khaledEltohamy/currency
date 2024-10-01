import 'package:currency_converter_app/src/core/network/api_helper.dart';
import 'package:currency_converter_app/src/modules/currencies/data/datasource/api_currencies_helper.dart';
import 'package:currency_converter_app/src/modules/currencies/data/datasource/local/local_datasource.dart';
import 'package:currency_converter_app/src/modules/currencies/data/repository/repository_imp.dart';
import 'package:currency_converter_app/src/modules/currencies/domain/repository/base_repository.dart';
import 'package:currency_converter_app/src/modules/currencies/domain/usecase/supported_currencies_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../modules/currencies/data/datasource/local/base_local_datasource.dart';
import '../../modules/currencies/data/datasource/remote/base_remote_datasource.dart';
import '../../modules/currencies/data/datasource/remote/remote_datasource.dart';

import '../../modules/currencies/domain/usecase/convert_currencies_usecase.dart';
import '../../modules/currencies/domain/usecase/historical_currenies_usecase.dart';
import '../../modules/currencies/presentation/bloc/converter_currencies_bloc/converter_currencies_bloc.dart';
import '../../modules/currencies/presentation/bloc/currencies_bloc/currencies_bloc.dart';
import '../../modules/currencies/presentation/bloc/historical_currency_bloc/historical_currency_bloc.dart';
import '../../modules/currencies/presentation/cubit/converter_list_cubit/converter_list_cubit.dart';
import '../network/network_checker.dart';

final getIt = GetIt.instance;

Future<void> init() async {

// Datasource 
getIt.registerLazySingleton<BaseRemoteDataSource>(() => DioRemoteDataSource(getIt()));
getIt.registerLazySingleton<BaseLocalDataSource>(() => LocalDataSourceImp());

// Repository
  getIt.registerLazySingleton<BaseRepository>(
      () => RepositoryImp(
            remoteDataSource: getIt(),
            networkChecker: getIt(),
            localDataSource: getIt(),
          ));
// UseCases

  getIt.registerLazySingleton<SupportedCurrenciesUsecase>(() => SupportedCurrenciesUsecase(repository: getIt()));

  getIt.registerLazySingleton<HistoricalCurreniesUsecase>(() => HistoricalCurreniesUsecase(repository: getIt()));

  getIt.registerLazySingleton<ConvertCurrenciesUseCase>(() => ConvertCurrenciesUseCase(repository: getIt()));

//Bloc
  getIt.registerFactory(() => CurrenciesBloc(currenciesUseCase: getIt()));
  getIt.registerFactory(() => ConverterCurrenciesBloc(getIt()));
  getIt.registerFactory(() => HistoricalCurrencyBloc(currenciesUseCase: getIt()));
  getIt.registerFactory(() => ConverterListCubit());


//Extra Injection
  getIt.registerLazySingleton<ApiHelper>(() => CurrenciesApiHelper());
  getIt.registerLazySingleton<NetWorkInfo>(() => NetworkChecker(internetConnectionChecker: getIt()));
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
