part of 'converter_currencies_bloc.dart';

abstract class ConverterCurrenciesEvent extends Equatable {
  const ConverterCurrenciesEvent();

  @override
  List<Object> get props => [];
}

class GetConverterCurrencies extends ConverterCurrenciesEvent {
  final String from , to ;
  final double amount ;

 const  GetConverterCurrencies({required this.from, required this.to, required this.amount});


}
