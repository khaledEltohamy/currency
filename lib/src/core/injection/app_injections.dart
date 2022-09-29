import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../modules/currencies/data/datasource/local_datasource.dart';
import '../../modules/currencies/data/datasource/remote_datasource.dart';
import '../../modules/currencies/data/repository/currencies_repository_imp.dart';
import '../../modules/currencies/domain/usecase/currencies_useCase.dart';
import '../../modules/currencies/presentation/bloc/converter_currencies_bloc/converter_currencies_bloc.dart';
import '../../modules/currencies/presentation/bloc/currencies_bloc/currencies_bloc.dart';
import '../../modules/currencies/presentation/bloc/historical_currency_bloc/historical_currency_bloc.dart';
import '../../modules/currencies/presentation/cubit/converter_list_cubit/converter_list_cubit.dart';
import '../network/network_checker.dart';

final getIt = GetIt.instance;

Future<void> init() async {
//Bloc
  getIt.registerFactory(() => CurrenciesBloc(
        currenciesUseCase: getIt(),
      ));
  getIt.registerFactory(() => ConverterCurrenciesBloc(getIt()));
  getIt.registerFactory(() => HistoricalCurrencyBloc(
        currenciesUseCase: getIt(),
      ));
  getIt.registerFactory(() => ConverterListCubit());

//Repository
  getIt.registerLazySingleton<CurrenciesRepositoryImp>(
      () => CurrenciesRepositoryImp(
            dioRemoteDataSource: getIt(),
            networkChecker: getIt(),
            sharedPefLocalDataSourceImp: getIt(),
          ));
//UseCases
  getIt.registerLazySingleton<CurrenciesUseCase>(
    () => CurrenciesUseCase(currenciesRepositoryImp: getIt()),
  );

//Core
  getIt.registerLazySingleton<DioRemoteDataSource>(() => DioRemoteDataSource());

  getIt.registerLazySingleton<SharedPefLocalDataSourceImp>(
      () => SharedPefLocalDataSourceImp(
            sharedPreferences: getIt(),
          ));
  getIt.registerLazySingleton<NetworkChecker>(
      () => NetworkChecker(internetConnectionChecker: getIt()));

//Extra Injection
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
