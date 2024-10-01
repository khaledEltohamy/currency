part of 'historical_currency_bloc.dart';

abstract class HistoricalCurrencyState extends Equatable {
  const HistoricalCurrencyState();

  @override
  List<Object> get props => [];
}

class HistoricalCurrencyInitial extends HistoricalCurrencyState {}

class HistoricalCurrencySuccess extends HistoricalCurrencyState {
  final List<HistoricalCurrenciesModel> historicalList;

  const HistoricalCurrencySuccess(this.historicalList);
}

class HistoricalCurrencyLoading extends HistoricalCurrencyState {}

class HistoricalCurrencyField extends HistoricalCurrencyState {
     final String? error;

  const HistoricalCurrencyField({this.error});
}
class HistoricalCurrencyOffline extends HistoricalCurrencyState {
    final String? error;

  const HistoricalCurrencyOffline({this.error});
}