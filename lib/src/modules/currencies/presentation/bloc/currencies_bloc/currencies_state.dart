part of 'currencies_bloc.dart';

abstract class CurrenciesState extends Equatable {
  const CurrenciesState();

  @override
  List<Object> get props => [];
}

class SupportedCurrenciesInitial extends CurrenciesState {}

class SupportedCurrenciesLoading extends CurrenciesState {}

class SupportedCurrenciesSuccess extends CurrenciesState {
  final List<SupportedCurrenciesModel> supportedCurrencies;

  const SupportedCurrenciesSuccess(this.supportedCurrencies);
}

class SupportedCurrenciesFialure extends CurrenciesState {
  final String? error;

  const SupportedCurrenciesFialure({required this.error});
}

class SupportedCurrenciesOffline extends CurrenciesState {
    final String? error;

  const SupportedCurrenciesOffline({this.error});
}
