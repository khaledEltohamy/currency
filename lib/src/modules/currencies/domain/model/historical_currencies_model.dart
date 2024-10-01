 class ResponseHistoricalCurrenciesModel {
  final List<HistoricalCurrenciesModel> historicalCurrencies;

  ResponseHistoricalCurrenciesModel({required this.historicalCurrencies});


 factory ResponseHistoricalCurrenciesModel.init()=> ResponseHistoricalCurrenciesModel(historicalCurrencies: []);
}

 class HistoricalCurrenciesModel {
  final String base , date ;
  final List<RatesModel> ratesModel;

  HistoricalCurrenciesModel({required this.base, required this.date, required this.ratesModel});


  
}

 class RatesModel {
  final String currency ;
  final num  value ;

  RatesModel({required this.currency, required this.value});
}