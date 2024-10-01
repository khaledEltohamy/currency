import 'package:currency_converter_app/src/core/constants/strings/app_strings.dart';
import 'package:currency_converter_app/src/core/base/base_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../domain/model/supported_currencies_model.dart';
import '../../../domain/usecase/supported_currencies_usecase.dart';

part 'currencies_event.dart';
part 'currencies_state.dart';

class CurrenciesBloc extends Bloc<CurrenciesEvent, CurrenciesState> {
  final SupportedCurrenciesUsecase currenciesUseCase;
  CurrenciesBloc({required this.currenciesUseCase})
      : super(SupportedCurrenciesInitial()) {
    on<GetSupportedCurrenciesEvent>(
        (event, emit) => _handelGetCurrenciesWithFlagsUseCase(event, emit));
  }

  _handelGetCurrenciesWithFlagsUseCase(
      GetSupportedCurrenciesEvent event, Emitter<CurrenciesState> emit) async {
    emit(SupportedCurrenciesLoading());
    final resultCurrencies = await currenciesUseCase.execute(params: NoParams());
    resultCurrencies.fold(
      (failure) {
        if (failure is FailureEmptyCache) {
          emit(SupportedCurrenciesOffline(error: AppString.handlingFiledMassageCase(failure)));
        } else if (failure is FailureService) {
          emit(SupportedCurrenciesFialure(error: AppString.handlingFiledMassageCase(failure)));
        }
      },
      (currenciesResponse) => emit(SupportedCurrenciesSuccess(currenciesResponse.supportedCurrencies)),
    );
  }
}
