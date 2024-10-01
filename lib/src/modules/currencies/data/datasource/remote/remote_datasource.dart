import 'dart:async';
import 'package:currency_converter_app/src/core/constants/strings/app_strings.dart';
import 'package:currency_converter_app/src/core/network/api_helper.dart';
import 'package:currency_converter_app/src/modules/currencies/data/entities/historical_currencies_entity.dart';
import 'package:currency_converter_app/src/utils/date_time/date_time_formater.dart';
import 'package:dio/dio.dart';
import '../../../../../core/errors/exception.dart';
import '../../entities/currency_converter_entity.dart';
import '../../entities/supported_currencies_entity.dart';
import 'base_remote_datasource.dart';



// ignore: must_be_immutable
class DioRemoteDataSource extends BaseRemoteDataSource {
  final ApiHelper apiHelper;
  DioRemoteDataSource(this.apiHelper);

  @override
  Future<ResponseSupportedCurrenciesEntity> fetchsupportedCurrencies() async {    
    try {
      
      final currenciesResponse = await apiHelper.postData(
       url: AppString.url.cloudmersive,
       headers: {AppString.key.cloudmersiveKeyName : AppString.key.cloudmersiveKey});
      
      ResponseSupportedCurrenciesEntity currencyModel = 
      ResponseSupportedCurrenciesEntity.fromJson(currenciesResponse.data);

      return currencyModel;
    } on DioException catch (e) {
      throw ExceptionService(error: e.message);
    }
  }
  @override
  Future<CurrencyConverterEntity> converterTwoCurrencies(String from, String to , double amount)async {
  try{
     final response = await apiHelper.getData(url:"${AppString.url.currencylayer}/convert?${AppString.key.currencylayerKeyName}=${AppString.key.currencylayerKey}&from=$from&to=$to&amount=$amount");
     final converterModel = CurrencyConverterEntity.fromJson(response.data);
     return converterModel;
    }on DioException catch (e){
     throw ExceptionService(error: e.message);
    }
  }
  
  @override
  Future<ResponseHistoricalCurrenciesEntity> historicalCurrencies() async {
    try {
      List<HistoricalCurrenciesEntity> historicConverterModelList = [];
   
      for (int i = 1; i <= 7; i++) {
        String date = "i".getYesterday(i);
        final response = await apiHelper.getData(
          url :"${AppString.url.exchangeratesapi}v1/$date?${AppString.key.exchangeratesapiKeyName}=${AppString.key.exchangeratesapiKey}&symbols=USD,CAD");
        historicConverterModelList.add(HistoricalCurrenciesEntity.fromJson(response.data));
      }

      return ResponseHistoricalCurrenciesEntity(historicalCurrencies: historicConverterModelList);
    } on DioException catch (e) {
      throw ExceptionService(error: e.message);
    }
    
  }
  

  


  @override
  List<Object?> get props => [apiHelper];
}
