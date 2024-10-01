part of 'currencies_bloc.dart';

abstract class CurrenciesEvent extends Equatable {
  const CurrenciesEvent();

  @override
  List<Object> get props => [];
}

class GetCurrenciesEvent extends CurrenciesEvent {}

class GetSupportedCurrenciesEvent extends CurrenciesEvent {}
