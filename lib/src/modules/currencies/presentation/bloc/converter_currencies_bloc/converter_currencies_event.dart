part of 'converter_currencies_bloc.dart';

abstract class ConverterCurrenciesEvent extends Equatable {
  const ConverterCurrenciesEvent();

  @override
  List<Object> get props => [];
}

class GetConverterCurrencies extends ConverterCurrenciesEvent {
  final CountryCurrencyEntity firstCountryCurrencyEntity;
  final CountryCurrencyEntity secondCountryCurrencyEntity;

  const GetConverterCurrencies({
    required this.firstCountryCurrencyEntity,
    required this.secondCountryCurrencyEntity,
  });
}
