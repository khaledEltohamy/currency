import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../errors/faliure.dart';

extension BaseUrl on String {
  String get cloudmersive => "https://api.cloudmersive.com/currency/exchange-rates/list-available";
  String get exchangeratesapi => "https://api.exchangeratesapi.io/";
  String get currencylayer => "https://api.currencylayer.com/";

}

extension KeysUrl on String {
   
   get cloudmersiveKey => dotenv.env["cloudmersiveKey"];
   get cloudmersiveKeyName => "Apikey";
   
   get exchangeratesapiKey => dotenv.env["exchangeratesapiKey"];
   get exchangeratesapiKeyName => "access_key";
   
   get currencylayerKey => dotenv.env["currencylayerKey"];
   get currencylayerKeyName => "access_key";
}
class AppString {

  static const key = "KEY";
  static const url = "URL";

  //Local Storage Keys
  static const cachedCurrencyBoxKey = "cachedCurrencyBoxKey";
  static const cachedCurrencyKey = "cachedCurrencyKey";
  //Errors
  static const dioError = 'Dio Error.';
  static const exception = 'Exception.';
  static const somethingWrong = 'Something Wrong!';
  static const connectionFailed = 'Sorry! Connection Failed.';
  static const emptyCached = 'Empty cached data.';
  static const defaultError = 'Something went wrong, Please try agin later.';

//Keys
  static const String amountFormKey = "amountFormKey";
   static const String buttonFormKey = "buttonFormKey";
  static const String amountValueNotRequired = "If amout value is 0 or empty , will take 1 automaticly";


  static String handlingFiledMassageCase(Failure failure) {
    if (failure is FailureService) {
      return defaultError;
    }
    if (failure is FailureOffline) {
      return connectionFailed;
    }
    if (failure is FailureEmptyCache) {
      return emptyCached;
    }else {
      return defaultError;
    }
  }
}
