import 'package:currency_converter_app/src/core/errors/faliure.dart';
import 'package:currency_converter_app/src/modules/currencies/domain/model/currency_converter_model.dart';
import 'package:currency_converter_app/src/modules/currencies/domain/model/historical_currencies_model.dart';
import 'package:currency_converter_app/src/modules/currencies/domain/model/supported_currencies_model.dart';
import 'package:currency_converter_app/src/core/base/base_use_case.dart';
import 'package:currency_converter_app/src/modules/currencies/domain/usecase/convert_currencies_usecase.dart';
import 'package:currency_converter_app/src/modules/currencies/domain/usecase/historical_currenies_usecase.dart';
import 'package:currency_converter_app/src/modules/currencies/domain/usecase/supported_currencies_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() async{
  late HistoricalCurreniesUsecase historicalCurreniesUseCase;
  late ConvertCurrenciesUseCase convertCurrenciesUseCase;
  late SupportedCurrenciesUsecase supportedCurrenciesUsecase;
  late MockBaseRepository mockRepository;
  setUpAll((){
    mockRepository = MockBaseRepository();
    historicalCurreniesUseCase = HistoricalCurreniesUsecase(repository: mockRepository);
    convertCurrenciesUseCase = ConvertCurrenciesUseCase(repository:mockRepository );
    supportedCurrenciesUsecase = SupportedCurrenciesUsecase(repository:mockRepository );
  });

  group("check flow historical Currenies useCase", () { 
    final ResponseHistoricalCurrenciesModel model = ResponseHistoricalCurrenciesModel.init();
final NoParams noParams = NoParams();
    test("should get right of success Repository response with success usecase", () async {
    when(mockRepository.historicalCurrencies()).thenAnswer((_) async=> Right(model));
    final result = await historicalCurreniesUseCase.execute(params: noParams);
    expect(result, Right(model));
    
  });
     test("should get left of faluire Repository response with faluire usecase", () async {
    when(mockRepository.historicalCurrencies()).thenAnswer((_) async=> Left(FailureService()));
    final result = await historicalCurreniesUseCase.execute(params: noParams);
    expect(result, Left(FailureService()));
    
  });

  });
  
    group("check flow supported Currencies useCase", () { 
    final ResponseSupportedCurrenciesModel model = ResponseSupportedCurrenciesModel.init();
    final NoParams noParams = NoParams();
    test("should get right of success Repository response with success usecase", () async {
    when(mockRepository.fetchsupportedCurrencies()).thenAnswer((_) async=> Right(model));
    final result = await supportedCurrenciesUsecase.execute(params: noParams);
    expect(result, Right(model));
    
  });
     test("should get left of faluire Repository response with faluire usecase", () async {
    when(mockRepository.fetchsupportedCurrencies()).thenAnswer((_) async=> Left(FailureService()));
    final result = await supportedCurrenciesUsecase.execute(params: noParams);
    expect(result, Left(FailureService()));
    
  });

  });
    group("check flow convert Currencies useCase", () { 
    final CurrencyConverterModel model = CurrencyConverterModel.init();
    final ConvertCurrenciesUseCaseParams successParams = ConvertCurrenciesUseCaseParams(from: 'EUR', to: 'USD', amount: 12);
    final ConvertCurrenciesUseCaseParams failureParams = ConvertCurrenciesUseCaseParams(from: 'EG', to: 'EE', amount: 0);
    
    test("should get right of success Repository response with success usecase", () async {
    when(mockRepository.converterTwoCurrencies(successParams)).thenAnswer((_) async=> Right(model));
    final result = await convertCurrenciesUseCase.execute(params: successParams);
    expect(result, Right(model));
    
  });
     test("should get left of faluire Repository response with faluire usecase", () async {
    when(mockRepository.converterTwoCurrencies(failureParams)).thenAnswer((_) async=> Left(FailureService()));
    final result = await convertCurrenciesUseCase.execute(params: failureParams);
    expect(result, Left(FailureService()));
    
  });

  });

}