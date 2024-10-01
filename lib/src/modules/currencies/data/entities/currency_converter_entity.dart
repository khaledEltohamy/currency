import 'package:currency_converter_app/src/modules/currencies/domain/model/currency_converter_model.dart';

import '../../../../core/base/base_layer_data_transformer.dart';

class CurrencyConverterEntity extends BaseLayerDataTransformer<CurrencyConverterEntity, CurrencyConverterModel> {
 final Query query ; 
 final Info info ;
 final num result ;
 CurrencyConverterEntity({required this.query, required this.info, required this.result});

  factory CurrencyConverterEntity.fromJson(Map<String , dynamic> json) =>
      CurrencyConverterEntity(
          query: Query.fromJson(json["query"]),
          info: Info.fromJson(json["info"] ), 
          result: json["result"]);
          
 @override
  List<Object?> get props => [query , info , result];
  

  
  @override
   CurrencyConverterModel transform()=>
   CurrencyConverterModel(query: query.transform(), info: info.transform(), result: result);
   
  @override
  CurrencyConverterEntity restore(CurrencyConverterModel data)=> 
  CurrencyConverterEntity(query: query, info: info, result: result);

  
}

class Query extends BaseLayerDataTransformer<Query, QueryModel> {
  final String from , to;
  final num amount ;

 Query({required this.from, required this.to, required this.amount});



 factory Query.fromJson(Map<String ,dynamic> json)=>
  Query(from: json["from"], to: json["to"], amount: json["amount"]);

 
  
  @override

  List<Object?> get props => [from , to , amount];
  
  @override
  Query restore(QueryModel data) => Query(amount: data.amount , from: data.from, to: data.to);
  
  @override
  QueryModel transform() => QueryModel(from: from, to: to, amount: amount);

}

class Info extends BaseLayerDataTransformer<Info, InfoModel> {
   final num quote;
   Info({required this.quote});

  factory Info.fromJson(Map<String ,dynamic> json)=> Info(quote: json["quote"]);

  @override
  List<Object?> get props => [quote];
  
  @override
  Info restore(InfoModel data) => Info(quote: data.quote);
  
  @override
  InfoModel transform() => InfoModel(quote: quote);



}