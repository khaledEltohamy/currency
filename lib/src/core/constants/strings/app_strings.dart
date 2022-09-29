import '../../errors/faliure.dart';

class AppString {
  //Keys
  static const ApiKey = "797b37664a3d10ec32d3";
  //URLs
  static const baseCurrenciesUrl = 'https://free.currconv.com';
  static const baseFlagUrl = "https://flagcdn.com";

  static const listCurrenciesUrl = "/api/v7/currencies?apiKey=$ApiKey";
  static const listCountryUrl = "/api/v7/countries?apiKey=$ApiKey";
  static const listHistoricalUrl =
      "https://free.currconv.com/api/v7/convert?q=USD_PHP,PHP_USD&compact=ultra&date=2022-3-12&apiKey=${ApiKey}";
  static const converterUrl =
      "/api/v7/convert?q=USD_PHP,PHP_USD&compact=ultra&callback=sampleCallback&apiKey=${ApiKey}";
  static const listCodeCountry = "/en/codes.json";
  //Paths Queries

  //Local Storage Keys
  static const cachedCountryCurrencyKey = "cachedCountryCurrencyKey";
  //Errors
  static const dioError = 'Dio Error.';
  static const exception = 'Exception.';
  static const somethingWrong = 'Something Wrong!';
  static const connectionFailed = 'Sorry! Connection Failed.';
  static const emptyCached = 'Empty cached data.';
  static const defaultError = 'Something went wrong, Please try agin later.';

//Success
  static const String successesAddItem = "Successes add Item.";
  static const String successesRemoveItem = "Successes Remove Item.";

  static dynamic handlingFiledMassageCase(Failure failure) {
    if (failure is FailureService) {
      return defaultError;
    }
    if (failure is FailureOffline) {
      return connectionFailed;
    }
    if (failure is FailureEmptyCache) {
      return emptyCached;
    }
  }
}
