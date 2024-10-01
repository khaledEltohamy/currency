import 'package:bloc_test/bloc_test.dart';
import 'package:currency_converter_app/src/core/errors/faliure.dart';
import 'package:currency_converter_app/src/modules/currencies/domain/model/currency_converter_model.dart';
import 'package:currency_converter_app/src/modules/currencies/domain/usecase/convert_currencies_usecase.dart';
import 'package:currency_converter_app/src/modules/currencies/presentation/bloc/converter_currencies_bloc/converter_currencies_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helper/test_helper.mocks.dart';



void main() {
  late MockConvertCurrenciesUseCase mockConvertCurrrencyUsecase; 
  late ConverterCurrenciesBloc converterCurrencieBloc;
  setUp(() {
  mockConvertCurrrencyUsecase = MockConvertCurrenciesUseCase();
  converterCurrencieBloc = ConverterCurrenciesBloc(mockConvertCurrrencyUsecase);
  } );
   group('Converter Currencies Bloc', () {
    final CurrencyConverterModel modelTest = CurrencyConverterModel.init();
    
    blocTest<ConverterCurrenciesBloc, ConverterCurrenciesState>(
      'init nothing',
      build: () => ConverterCurrenciesBloc(MockConvertCurrenciesUseCase()),
      expect: () =>  <ConverterCurrenciesState>[],
    );

    blocTest<ConverterCurrenciesBloc, ConverterCurrenciesState>(
      'emits CurrenciesConverterLoading and CurrenciesConverterSuccess when in success case',
       
      build: () {
      when(mockConvertCurrrencyUsecase.execute(
        params: ConvertCurrenciesUseCaseParams(from: 'EUR', to: 'USD', amount: 1)))
      .thenAnswer((_)async=> Right(modelTest));
      return converterCurrencieBloc;
      },
      act: (bloc) => bloc.add(const GetConverterCurrencies(from: 'EUR', to: 'USD', amount: 1)),
      expect: () => <ConverterCurrenciesState>[CurrenciesConverterLoading() , CurrenciesConverterSuccess(modelTest)],
      wait:const  Duration(seconds: 2),
    );
    
    blocTest<ConverterCurrenciesBloc, ConverterCurrenciesState>(
      'emits SupportedCurrenciesLoading ,  SupportedCurrenciesFailure when  in failure case',
       
      build: () { 
      when(mockConvertCurrrencyUsecase.execute(params: ConvertCurrenciesUseCaseParams(from: 'ENGLEND', to: 'EGYPT', amount: 0))).thenAnswer((_)async=> Left(FailureService()));
      return converterCurrencieBloc;
      },
      act: (bloc) => bloc.add(const GetConverterCurrencies(from: 'ENGLEND', to: 'EGYPT', amount: 0)),
      expect: () => <ConverterCurrenciesState>[CurrenciesConverterLoading() , CurrenciesConverterField()],
      wait:const  Duration(seconds: 2),
    );
  });

}

