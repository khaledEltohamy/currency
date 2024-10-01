part of 'converter_currencies_bloc.dart';

abstract class ConverterCurrenciesState extends Equatable {
  const ConverterCurrenciesState();


}

class ConverterCurrenciesInitial extends ConverterCurrenciesState {
    @override
  List<Object> get props => [];
}

class CurrenciesConverterField extends ConverterCurrenciesState {
 final  String? error;

const CurrenciesConverterField({ this.error});
    @override
  List<Object> get props => [error ?? ""];
}

class CurrenciesConverterSuccess extends ConverterCurrenciesState {
  final CurrencyConverterModel converterModel;

  const CurrenciesConverterSuccess(this.converterModel);
    @override
  List<Object> get props => [converterModel];
}

class CurrenciesConverterLoading extends ConverterCurrenciesState {
  @override
  List<Object> get props => [];
}
