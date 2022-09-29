import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/currencies_useCase.dart';

part 'historical_currency_event.dart';
part 'historical_currency_state.dart';

class HistoricalCurrencyBloc
    extends Bloc<HistoricalCurrencyEvent, HistoricalCurrencyState> {
  final CurrenciesUseCase currenciesUseCase;

  HistoricalCurrencyBloc({required this.currenciesUseCase})
      : super(HistoricalCurrencyInitial()) {
    on<GetHistoricalCurrencyEvent>(
        (event, emit) => _handelHistoricalCurrenciesUseCase(event, emit));
  }

  _handelHistoricalCurrenciesUseCase(GetHistoricalCurrencyEvent event,
      Emitter<HistoricalCurrencyState> emit) async {
    emit(HistoricalCurrencyLoading());
    final result = await currenciesUseCase.callHistoricalCurrencies();
    result.fold((failure) => emit(HistoricalCurrencyField()),
        (response) => emit(HistoricalCurrencySuccess(response)));
  }
}
