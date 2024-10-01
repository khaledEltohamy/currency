

import 'package:equatable/equatable.dart';

class CurrencyConverterModel extends Equatable {
  final QueryModel query;
  final InfoModel info;
  final num result;
         

  const CurrencyConverterModel({required this.query, required this.info, required this.result});
  factory CurrencyConverterModel.init()=> const CurrencyConverterModel(query: QueryModel(from: "EUR", to: "USD", amount: 1), info: InfoModel(quote: 0), result: 0);
  @override
  List<Object?> get props => [];

  
}

class QueryModel extends Equatable{
  final String from;
  final String  to;
  final num amount;

 const QueryModel({required this.from, required this.to, required this.amount});
 
  @override

  List<Object?> get props => [];

}

class InfoModel extends Equatable{
final num quote;

 const InfoModel({required this.quote});
 
  @override
  List<Object?> get props => [];

}