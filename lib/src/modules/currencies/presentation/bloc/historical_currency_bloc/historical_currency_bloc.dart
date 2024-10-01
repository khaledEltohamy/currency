import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/strings/app_strings.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../domain/model/historical_currencies_model.dart';
import '../../../../../core/base/base_use_case.dart';
import '../../../domain/usecase/historical_currenies_usecase.dart';


part 'historical_currency_event.dart';
part 'historical_currency_state.dart';

class HistoricalCurrencyBloc
    extends Bloc<HistoricalCurrencyEvent, HistoricalCurrencyState> {
  final HistoricalCurreniesUsecase currenciesUseCase;

  HistoricalCurrencyBloc({required this.currenciesUseCase})
      : super(HistoricalCurrencyInitial()) {
    on<GetHistoricalCurrencyEvent>(
        (event, emit) => _handelHistoricalCurrenciesUseCase(event, emit));
  }

  _handelHistoricalCurrenciesUseCase(GetHistoricalCurrencyEvent event,
      Emitter<HistoricalCurrencyState> emit) async {
    emit(HistoricalCurrencyLoading());
    final result = await currenciesUseCase.execute(params: NoParams());
    result.fold((failure) {
        if (failure is FailureOffline) {
          emit(HistoricalCurrencyOffline(error: AppString.handlingFiledMassageCase(failure)));
        } else if (failure is FailureService) {
          emit(HistoricalCurrencyField(error: AppString.handlingFiledMassageCase(failure)));
        }
      },
        (response) => emit(HistoricalCurrencySuccess(response.historicalCurrencies)));
  }
}
