import 'package:currency_converter_app/src/core/base/base_layer_data_transformer.dart';

import '../../domain/model/supported_currencies_model.dart';


class ResponseSupportedCurrenciesEntity extends BaseLayerDataTransformer<ResponseSupportedCurrenciesEntity , ResponseSupportedCurrenciesModel> {
  final List<SupportedCurrenciesEntity> supportedCurrencies;

  ResponseSupportedCurrenciesEntity({required this.supportedCurrencies});

  factory ResponseSupportedCurrenciesEntity.fromJson(Map<String, dynamic> json) =>
  
 
  
  
      ResponseSupportedCurrenciesEntity(
           supportedCurrencies: List<SupportedCurrenciesEntity>.from(
            json["Currencies"].map((currency) => SupportedCurrenciesEntity.fromJson(currency))));

  

  
  @override
  ResponseSupportedCurrenciesEntity restore(ResponseSupportedCurrenciesModel data) => ResponseSupportedCurrenciesEntity(
    supportedCurrencies: List<SupportedCurrenciesEntity>.from(
    data.supportedCurrencies.map(
    (currency)=>supportedCurrencies.map(
    (entity)=>entity.restore(currency))).toList()));
  
  @override
  ResponseSupportedCurrenciesModel transform()=> 
  ResponseSupportedCurrenciesModel(supportedCurrencies: supportedCurrencies.map((currency)=> currency.transform()).toList());
  
  
  @override
  List<Object?> get props => [];
  
  @override
  bool? get stringify => true;
}

class SupportedCurrenciesEntity extends BaseLayerDataTransformer<SupportedCurrenciesEntity , SupportedCurrenciesModel> {
  final String? currencyName,
         currencySymbol,
        isoCurrencyCode, 
         countryName , 
         countryCode , 
        countryIsoCode ,
        image;

    SupportedCurrenciesEntity(
      { this.currencyName,
       this.currencySymbol,
       this.isoCurrencyCode, 
       this.countryName , 
       this.countryCode , 
       this.countryIsoCode ,
       this.image});

  factory SupportedCurrenciesEntity.fromJson(Map<String, dynamic> json) => SupportedCurrenciesEntity(
        isoCurrencyCode: json['ISOCurrencyCode'] ,
        currencySymbol: json['CurrencySymbol'],
        currencyName: json['CurrencyEnglishName'],
        countryName:json['CountryName'] ,
        countryCode: json['CountryThreeLetterCode'],
        countryIsoCode : json["CountryISOTwoLetterCode"],
        image: json["image"] ?? "https://flagcdn.com/16x12/${json["CountryISOTwoLetterCode"].toLowerCase()}.png"
    
      );

     Map<String ,dynamic> toJson()=>{
        "ISOCurrencyCode": isoCurrencyCode ,
        "CurrencySymbol": currencySymbol,
        "CurrencyEnglishName": currencyName,
        "CountryName":countryName ,
        "CountryThreeLetterCode": countryCode,
        "CountryISOTwoLetterCode" : countryIsoCode,
        "image": image
      };


  
  @override
  SupportedCurrenciesEntity restore(SupportedCurrenciesModel data)=> SupportedCurrenciesEntity(
        isoCurrencyCode: data.isoCurrencyCode ,
        currencySymbol: data.currencySymbol,
        currencyName: data.currencyName,
        countryName: data.countryName ,
        countryCode: data.countryCode,
        countryIsoCode : data.countryIsoCode,
        image: data.image
    
      );
  
  @override
  SupportedCurrenciesModel transform()=>  SupportedCurrenciesModel(
         isoCurrencyCode: isoCurrencyCode ,
        currencySymbol: currencySymbol,
        currencyName: currencyName,
        countryName: countryName ,
        countryCode: countryCode,
        countryIsoCode : countryIsoCode,
        image: image
  );
  @override
  List<Object?> get props => [];
}
