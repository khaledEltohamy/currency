part of 'currencies_bloc.dart';

abstract class CurrenciesState extends Equatable {
  const CurrenciesState();

  @override
  List<Object> get props => [];
}

class CurrenciesInitial extends CurrenciesState {}

class CurrenciesWithFlagsLoading extends CurrenciesState {}

class CurrenciesWithFlagsSuccess extends CurrenciesState {
  final List<CountryCurrencyModel> responseCountryCurrencyEntity;

  const CurrenciesWithFlagsSuccess(this.responseCountryCurrencyEntity);
}

class CurrenciesWithFlagsField extends CurrenciesState {}

class CurrenciesWithFlagsOffline extends CurrenciesState {}
