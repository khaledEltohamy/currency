import 'package:bloc_test/bloc_test.dart';
import 'package:currency_converter_app/src/core/errors/faliure.dart';
import 'package:currency_converter_app/src/modules/currencies/domain/model/historical_currencies_model.dart';
import 'package:currency_converter_app/src/core/base/base_use_case.dart';
import 'package:currency_converter_app/src/modules/currencies/presentation/bloc/historical_currency_bloc/historical_currency_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helper/test_helper.mocks.dart';



void main() {
  late MockHistoricalCurreniesUsecase mockHistoricalCurreniesUsecase; 
  late HistoricalCurrencyBloc historicalCurrencyBloc;
  setUp(() {
  mockHistoricalCurreniesUsecase = MockHistoricalCurreniesUsecase();
  historicalCurrencyBloc = HistoricalCurrencyBloc(currenciesUseCase : mockHistoricalCurreniesUsecase);
  } );
   group('historical Currency Bloc', () {
    final ResponseHistoricalCurrenciesModel modelTest = ResponseHistoricalCurrenciesModel.init();
    
    blocTest<HistoricalCurrencyBloc, HistoricalCurrencyState>(
      'init nothing',
      build: () => HistoricalCurrencyBloc( currenciesUseCase : MockHistoricalCurreniesUsecase()),
      expect: () =>  <HistoricalCurrencyState>[],
    );

    blocTest<HistoricalCurrencyBloc, HistoricalCurrencyState>(
      'emits HistoricalCurrencyLoading and HistoricalCurrencySuccess when in success case',
       
      build: () {
      when(mockHistoricalCurreniesUsecase.execute(params: NoParams())).thenAnswer(
        (_)async=> Right(modelTest));
      return historicalCurrencyBloc;
      },
      act: (bloc) => bloc.add( GetHistoricalCurrencyEvent()),
      expect: () => <HistoricalCurrencyState>[HistoricalCurrencyLoading() ,const HistoricalCurrencySuccess([])],
      wait:const  Duration(seconds: 2),
    );
    
    blocTest<HistoricalCurrencyBloc, HistoricalCurrencyState>(
      'emits HistoricalCurrencyLoading ,  HistoricalCurrencyField when  in failure case',
       
      build: () {
      when(mockHistoricalCurreniesUsecase.execute(params: NoParams())).thenAnswer((_)async=> Left(FailureService()));
      return historicalCurrencyBloc;
      },
      act: (bloc) => bloc.add(GetHistoricalCurrencyEvent()),
      expect: () => <HistoricalCurrencyState>[HistoricalCurrencyLoading() , HistoricalCurrencyField()],
      wait:const  Duration(seconds: 2),
    );
  });

}

