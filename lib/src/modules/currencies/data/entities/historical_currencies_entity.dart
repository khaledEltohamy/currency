import 'package:currency_converter_app/src/modules/currencies/domain/model/historical_currencies_model.dart';

import '../../../../core/base/base_layer_data_transformer.dart';
class ResponseHistoricalCurrenciesEntity extends BaseLayerDataTransformer<ResponseHistoricalCurrenciesEntity, ResponseHistoricalCurrenciesModel> {
  final List<HistoricalCurrenciesEntity> historicalCurrencies;

  ResponseHistoricalCurrenciesEntity({required this.historicalCurrencies});
  

  


  
  @override
  ResponseHistoricalCurrenciesEntity restore(ResponseHistoricalCurrenciesModel data) => ResponseHistoricalCurrenciesEntity(
    historicalCurrencies: List<HistoricalCurrenciesEntity>.from(
    data.historicalCurrencies.map(
    (historical)=>historicalCurrencies.map(
    (entity)=>entity.restore(historical))).toList()));
  
  @override
  ResponseHistoricalCurrenciesModel transform()=> ResponseHistoricalCurrenciesModel(historicalCurrencies: historicalCurrencies.map((historical)=> historical.transform()).toList());

  @override
  List<Object?> get props => [];
}

class HistoricalCurrenciesEntity extends BaseLayerDataTransformer<HistoricalCurrenciesEntity, HistoricalCurrenciesModel> {
 final String base, date; 
 final List<RatesEntity> ratesEntity ; 
    HistoricalCurrenciesEntity({required this.base, required this.date, required this.ratesEntity});
 
  factory HistoricalCurrenciesEntity.fromJson(Map<String ,dynamic> json){
    Map<String , dynamic> rate = json["rates"];
    return HistoricalCurrenciesEntity(
      base: json["base"], 
      date: json["date"], 
     ratesEntity: rate.entries.map((MapEntry<String, dynamic> rate)=>RatesEntity.fromJson(rate)).toList());
  }

 
  

  
  @override
  HistoricalCurrenciesEntity restore(HistoricalCurrenciesModel data)=> HistoricalCurrenciesEntity(base: data.base, date: data.date, 
    ratesEntity: List<RatesEntity>.from(
    data.ratesModel.map(
    (rateModel)=>ratesEntity.map(
    (entity)=>entity.restore(rateModel))).toList()));
  
  @override
  HistoricalCurrenciesModel transform()=> HistoricalCurrenciesModel(base: base, date: date, ratesModel: ratesEntity.map((rate)=> rate.transform()).toList());


  @override
  List<Object?> get props => [];
   

 
}


class RatesEntity extends BaseLayerDataTransformer<RatesEntity, RatesModel>{
  final String currency;
  final num value;

 RatesEntity({required this.currency, required this.value});
 factory RatesEntity.fromJson(MapEntry<String, dynamic> json)=> 
 RatesEntity(currency: json.key, value: json.value);


 

 
  @override
  RatesEntity restore(RatesModel data)=> RatesEntity(currency: data.currency, value: data.value);
 
  @override
  RatesModel transform()=> RatesModel(currency: currency, value: value);
  
  @override
  List<Object?> get props => [];
}