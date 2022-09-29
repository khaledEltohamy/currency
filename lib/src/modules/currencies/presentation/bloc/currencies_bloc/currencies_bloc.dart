import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../data/model/country_currency_model.dart';
import '../../../domain/usecase/currencies_useCase.dart';

part 'currencies_event.dart';
part 'currencies_state.dart';

class CurrenciesBloc extends Bloc<CurrenciesEvent, CurrenciesState> {
  final CurrenciesUseCase currenciesUseCase;
  CurrenciesBloc({required this.currenciesUseCase})
      : super(CurrenciesInitial()) {
    on<GetCurrenciesWithFlagsEvent>(
        (event, emit) => _handelCountriesWithFlagsUseCase(event, emit));
  }

  _handelCountriesWithFlagsUseCase(
      GetCurrenciesWithFlagsEvent event, Emitter<CurrenciesState> emit) async {
    emit(CurrenciesWithFlagsLoading());
    final resultCurrencies =
        await currenciesUseCase.callCountriesCurrenciesFlags();
    resultCurrencies.fold(
      (failure) {
        if (failure is FailureEmptyCache) {
          emit(CurrenciesWithFlagsOffline());
        } else if (failure is FailureService) {
          emit(CurrenciesWithFlagsField());
        }
      },
      (currenciesResponse) =>
          emit(CurrenciesWithFlagsSuccess(currenciesResponse)),
    );
  }
}
