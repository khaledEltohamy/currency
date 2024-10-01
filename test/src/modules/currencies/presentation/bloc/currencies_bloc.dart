import 'package:bloc_test/bloc_test.dart';
import 'package:currency_converter_app/src/core/errors/faliure.dart';
import 'package:currency_converter_app/src/modules/currencies/domain/model/supported_currencies_model.dart';
import 'package:currency_converter_app/src/core/base/base_use_case.dart';
import 'package:currency_converter_app/src/modules/currencies/presentation/bloc/currencies_bloc/currencies_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helper/test_helper.mocks.dart';



void main() {
  late MockSupportedCurrenciesUsecase mockSupportedCurrenciesUsecase; 
  late CurrenciesBloc currenciesBloc;
  setUp(() {
  mockSupportedCurrenciesUsecase = MockSupportedCurrenciesUsecase();
  currenciesBloc = CurrenciesBloc(currenciesUseCase: mockSupportedCurrenciesUsecase);
  } );
   group('currenciesBloc', () {
    final ResponseSupportedCurrenciesModel modelTest = ResponseSupportedCurrenciesModel.init();
    
    blocTest<CurrenciesBloc, CurrenciesState>(
      'init nothing',
      build: () => CurrenciesBloc(currenciesUseCase: MockSupportedCurrenciesUsecase()),
      expect: () =>  <CurrenciesState>[],
    );

    blocTest<CurrenciesBloc, CurrenciesState>(
      'emits SupportedCurrenciesLoading and SupportedCurrenciesSuccess when in success case',
       
      build: () {
      when(mockSupportedCurrenciesUsecase.execute(params: NoParams())).thenAnswer(
        (_)async=> Right(modelTest));
      return currenciesBloc;
      },
      act: (bloc) => bloc.add(GetSupportedCurrenciesEvent()),
      expect: () => <CurrenciesState>[SupportedCurrenciesLoading() ,const SupportedCurrenciesSuccess([])],
      wait:const  Duration(seconds: 2),
    );
    
    blocTest<CurrenciesBloc, CurrenciesState>(
      'emits SupportedCurrenciesLoading ,  SupportedCurrenciesFailure when  in failure case',
       
      build: () {
      when(mockSupportedCurrenciesUsecase.execute(params: NoParams())).thenAnswer((_)async=> Left(FailureService()));
      return currenciesBloc;
      },
      act: (bloc) => bloc.add(GetSupportedCurrenciesEvent()),
      expect: () => <CurrenciesState>[SupportedCurrenciesLoading() ,const SupportedCurrenciesFialure(error: "error")],
      wait:const  Duration(seconds: 2),
    );
  });

}


