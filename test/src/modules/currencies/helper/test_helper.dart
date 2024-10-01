import 'package:currency_converter_app/src/core/network/api_helper.dart';
import 'package:currency_converter_app/src/core/network/network_checker.dart';
import 'package:currency_converter_app/src/modules/currencies/data/datasource/local/base_local_datasource.dart';
import 'package:currency_converter_app/src/modules/currencies/data/datasource/remote/base_remote_datasource.dart';
import 'package:currency_converter_app/src/modules/currencies/domain/repository/base_repository.dart';
import 'package:currency_converter_app/src/modules/currencies/domain/usecase/convert_currencies_usecase.dart';
import 'package:currency_converter_app/src/modules/currencies/domain/usecase/historical_currenies_usecase.dart';
import 'package:currency_converter_app/src/modules/currencies/domain/usecase/supported_currencies_usecase.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
   BaseRepository,
   BaseRemoteDataSource,
   BaseLocalDataSource,
   ConvertCurrenciesUseCase,
   SupportedCurrenciesUsecase,
   HistoricalCurreniesUsecase,
   ApiHelper
  ],
)

@GenerateNiceMocks([
  MockSpec<NetWorkInfo>()
])

void main() {}