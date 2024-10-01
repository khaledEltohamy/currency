
import 'package:currency_converter_app/src/modules/currencies/data/entities/currency_converter_entity.dart';
import 'package:currency_converter_app/src/modules/currencies/data/entities/historical_currencies_entity.dart';
import 'package:currency_converter_app/src/modules/currencies/data/entities/supported_currencies_entity.dart';
import 'package:currency_converter_app/src/modules/currencies/domain/model/currency_converter_model.dart';
import 'package:currency_converter_app/src/modules/currencies/domain/model/historical_currencies_model.dart';
import 'package:currency_converter_app/src/modules/currencies/domain/model/supported_currencies_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helper/dummy_data/currency_converter_response.dart';
import '../../helper/dummy_data/supported_currency_response.dart';


void main() {

  group("check types of model / entity", (){
      ResponseSupportedCurrenciesEntity modelSupportedCurrencies = ResponseSupportedCurrenciesEntity.fromJson(SupportedCurrencyDummyResponse.getSuccessCase());
   CurrencyConverterEntity modelCurrencyConverter = CurrencyConverterEntity.fromJson(CurrencyConverterDummyResponse.getSuccess());
   ResponseHistoricalCurrenciesEntity modelHistoricalCurrencies = ResponseHistoricalCurrenciesEntity(historicalCurrencies: []);

      test("should ResponseSupportedCurrenciesEntity is subclass of ResponseSupportedCurrenciesModel", () {
    expect(modelSupportedCurrencies.transform(), isA<ResponseSupportedCurrenciesModel>());
   });
    test("should CurrencyConverterEntity is subclass of CurrencyConverterModel", () {
    expect(modelCurrencyConverter.transform(), isA<CurrencyConverterModel>());
   });
    test("should ResponseHistoricalCurrenciesEntity is subclass of ResponseHistoricalCurrenciesModel", () {
    expect(modelHistoricalCurrencies.transform(), isA<ResponseHistoricalCurrenciesModel>());
   });
      });
   
   }