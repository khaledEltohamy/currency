import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/datasource/remote_datasource.dart';
import '../../../data/model/converter_model.dart';
import '../../../domain/entites/country_currency_entity.dart';
import '../../../domain/usecase/currencies_useCase.dart';

part 'converter_currencies_event.dart';
part 'converter_currencies_state.dart';

class ConverterCurrenciesBloc
    extends Bloc<ConverterCurrenciesEvent, ConverterCurrenciesState> {
  final CurrenciesUseCase currenciesUseCase;
  ConverterCurrenciesBloc(this.currenciesUseCase)
      : super(ConverterCurrenciesInitial()) {
    on<GetConverterCurrencies>(
        (event, emit) => _handelConverter_Currencies_UseCase(event, emit));
  }

  _handelConverter_Currencies_UseCase(GetConverterCurrencies event,
      Emitter<ConverterCurrenciesState> emit) async {
    emit(CurrenciesConverterLoading());
    final resultCurrencies = await currenciesUseCase.callConverter(
      firstCurrencyId: event.firstCountryCurrencyEntity.currencyId,
      secondCurrencyId: event.secondCountryCurrencyEntity.currencyId,
    );
    resultCurrencies.fold(
      (failure) {
        emit(CurrenciesConverterField());
      },
      (currenciesResponse) =>
          emit(CurrenciesConverterSuccess(currenciesResponse)),
    );
  }
}
