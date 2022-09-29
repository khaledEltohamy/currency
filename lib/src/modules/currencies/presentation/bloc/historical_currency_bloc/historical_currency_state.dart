part of 'historical_currency_bloc.dart';

abstract class HistoricalCurrencyState extends Equatable {
  const HistoricalCurrencyState();

  @override
  List<Object> get props => [];
}

class HistoricalCurrencyInitial extends HistoricalCurrencyState {}

class HistoricalCurrencySuccess extends HistoricalCurrencyState {
  final List<Map<String, dynamic>> historicalList;

  const HistoricalCurrencySuccess(this.historicalList);
}

class HistoricalCurrencyLoading extends HistoricalCurrencyState {}

class HistoricalCurrencyField extends HistoricalCurrencyState {}
