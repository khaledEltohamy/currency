part of 'historical_currency_bloc.dart';

abstract class HistoricalCurrencyEvent extends Equatable {
  const HistoricalCurrencyEvent();

  @override
  List<Object> get props => [];
}

class GetHistoricalCurrencyEvent extends HistoricalCurrencyEvent {}
