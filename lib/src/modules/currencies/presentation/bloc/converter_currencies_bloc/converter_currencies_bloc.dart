import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/constants/strings/app_strings.dart';
import '../../../domain/model/currency_converter_model.dart';
import '../../../domain/usecase/convert_currencies_usecase.dart';

part 'converter_currencies_event.dart';
part 'converter_currencies_state.dart';

class ConverterCurrenciesBloc
    extends Bloc<ConverterCurrenciesEvent, ConverterCurrenciesState> {
  final ConvertCurrenciesUseCase converterCurrenciesUseCase;
  ConverterCurrenciesBloc(this.converterCurrenciesUseCase)
      : super(ConverterCurrenciesInitial()) {
    on<GetConverterCurrencies>((event, emit) => _handelConverterCurrenciesUseCase(event, emit));
  }

  _handelConverterCurrenciesUseCase(GetConverterCurrencies event,Emitter<ConverterCurrenciesState> emit) async {
  
    emit(CurrenciesConverterLoading());
    final resultCurrencies = await converterCurrenciesUseCase.execute(
     params: ConvertCurrenciesUseCaseParams(amount: event.amount, from: event.from, to:event.to )
    );
    resultCurrencies.fold(
      (failure) {
        emit( CurrenciesConverterField(error: AppString.handlingFiledMassageCase(failure)));
      },
      (currenciesResponse) =>
          emit(CurrenciesConverterSuccess(currenciesResponse)),
    );
  }
}
