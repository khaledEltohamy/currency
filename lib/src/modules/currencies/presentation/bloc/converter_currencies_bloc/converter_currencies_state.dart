part of 'converter_currencies_bloc.dart';

abstract class ConverterCurrenciesState extends Equatable {
  const ConverterCurrenciesState();

  @override
  List<Object> get props => [];
}

class ConverterCurrenciesInitial extends ConverterCurrenciesState {}

class CurrenciesConverterField extends ConverterCurrenciesState {}

class CurrenciesConverterSuccess extends ConverterCurrenciesState {
  final ConverterModel converterModel;

  const CurrenciesConverterSuccess(this.converterModel);
}

class CurrenciesConverterLoading extends ConverterCurrenciesState {}
