import 'package:equatable/equatable.dart';

 class ResponseSupportedCurrenciesModel extends Equatable {
  final List<SupportedCurrenciesModel> supportedCurrencies;
 
  const ResponseSupportedCurrenciesModel(
      {required this.supportedCurrencies});
  factory ResponseSupportedCurrenciesModel.init()=> 
  const ResponseSupportedCurrenciesModel(supportedCurrencies:  []);

         @override
         List<Object?> get props =>[];

}

 class SupportedCurrenciesModel extends Equatable {
  final String? currencyName,currencySymbol,isoCurrencyCode, countryName , countryCode , countryIsoCode , image;

  const SupportedCurrenciesModel(
        { this.currencyName,
       this.currencySymbol,
       this.isoCurrencyCode, 
       this.countryName , 
       this.countryCode , 
       this.countryIsoCode ,
       this.image});
       
         @override
         List<Object?> get props =>[];
}
