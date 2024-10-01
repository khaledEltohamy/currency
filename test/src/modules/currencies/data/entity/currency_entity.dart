
import 'package:currency_converter_app/src/modules/currencies/data/entities/currency_converter_entity.dart';
import 'package:currency_converter_app/src/modules/currencies/data/entities/historical_currencies_entity.dart';
import 'package:currency_converter_app/src/modules/currencies/data/entities/supported_currencies_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helper/dummy_data/currency_converter_response.dart';
import '../../helper/dummy_data/supported_currency_response.dart';


void main() {

  group("check mapping json to entity", (){
      ResponseSupportedCurrenciesEntity modelSupportedCurrencies = ResponseSupportedCurrenciesEntity.fromJson(SupportedCurrencyDummyResponse.getSuccessCase());
      CurrencyConverterEntity modelCurrencyConverter = CurrencyConverterEntity.fromJson(CurrencyConverterDummyResponse.getSuccess());
      ResponseHistoricalCurrenciesEntity modelHistoricalCurrencies = ResponseHistoricalCurrenciesEntity(historicalCurrencies: []);

    test("should ResponseSupportedCurrenciesEntity after mapping json", () {
    expect(modelSupportedCurrencies, isA<ResponseSupportedCurrenciesEntity>());
   });
    test("should CurrencyConverterEntity after mapping json", () {
    expect(modelCurrencyConverter.transform(), isA<CurrencyConverterEntity>());
   });
    test("should ResponseHistoricalCurrenciesEntity after mapping json", () {
    expect(modelHistoricalCurrencies.transform(), isA<ResponseHistoricalCurrenciesEntity>());
   });
      });
   
   }