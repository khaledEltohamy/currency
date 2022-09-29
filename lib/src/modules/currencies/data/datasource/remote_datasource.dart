import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz_unsafe.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../core/constants/strings/app_strings.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/network/api_helper.dart';
import '../../domain/entites/country_code_entity.dart';
import '../../domain/entites/country_entity.dart';
import '../../domain/entites/currency_entity.dart';
import '../model/converter_model.dart';
import '../model/country_code_model.dart';
import '../model/country_currency_model.dart';
import '../model/country_model.dart';
import '../model/currency_model.dart';

abstract class BaseRemoteDataSource extends Equatable {
  Future<ResponseCurrencyEntity> fetchAllCurrencies();
  Future<ResponseCountriesEntity> fetchAllCountries();
  Future<ResponseCountryCodeEntity> fetchCodeCountry();

  Future<List<CountryCurrencyModel>> fetchAllCountriesCurrencyFlags();
  Future<ConverterModel> converterTwoCurrencies(
      String firstCurrencyId, String secoundCurrencyId);
  Future<List<Map<String, dynamic>>> historicalCurrencies();
}

class DioRemoteDataSource extends CurrenciesApiHelper
    implements BaseRemoteDataSource {
  //TODO: SOLVING BY RXDART ZIPSTREAM //////////////
  // solving multi requests problem with zipStream() solution.
  @override
  Future<List<CountryCurrencyModel>> fetchAllCountriesCurrencyFlags() async {
    Dio dioFlag = Dio();

    try {
      List<String> currencyIdList = [];
      List<String> currencyCountryIdList = [];
      List<String> countryIdList = [];
      List<CountryCurrencyModel> items = [];
      ResponseCountryCurrency responseCountryCurrency;
      bool isDone = false;

      ZipStream<Response, List<CountryCurrencyModel>> streamResponse =
          ZipStream([
        Stream.fromFuture(
          dio.get("api/v7/currencies?apiKey=797b37664a3d10ec32d3"),
        ),
        Stream.fromFuture(
          dio.get("api/v7/countries?apiKey=797b37664a3d10ec32d3"),
        ),
        Stream.fromFuture(
          dioFlag.get("https://flagcdn.com/en/codes.json"),
        )
      ], (values) {
        ResponseCurrencyModel currencyModel =
            ResponseCurrencyModel.fromJson(values[0].data);
        ResponseCountriesModel countryModel =
            ResponseCountriesModel.fromJson(values[1].data);
        ResponseCountryCodeModel codeCountry =
            ResponseCountryCodeModel.fromJson(values[2].data);

        for (var idCurrency in currencyModel.currencies.currencyMap) {
          currencyIdList.add(idCurrency.id);
        }

        for (var currencyCountryId
            in countryModel.mapCountriesEntity.countriesMap) {
          currencyCountryIdList.add(currencyCountryId.currencyId);
        }
        for (var countryId in codeCountry.countriesCodesEntity) {
          countryIdList.add(countryId.code);
        }
        var list = countryModel.mapCountriesEntity.countriesMap.where(
            (countryEntity) =>
                currencyIdList.contains(countryEntity.currencyId) &&
                countryIdList.contains(countryEntity.id.toLowerCase()));
        for (var i in list) {
          items.add(CountryCurrencyModel(
              currencyId: i.currencyId,
              country_code_id: i.id.toLowerCase(),
              country_image_code_Id:
                  "https://flagcdn.com/16x12/${i.id.toLowerCase()}.png",
              countryName: i.name,
              currencyName: i.currencyName,
              currencySymbol: i.currencySymbol));
        }
        return items;
      });

      return await streamResponse.first;
    } on DioError catch (e) {
      print("--------errors Countries ${e.error.toString()}");
      print("--------statuscode Countries ${e.response}");

      throw ExceptionService();
    }
  }

  @override
  Future<ResponseCurrencyEntity> fetchAllCurrencies() async {
    try {
      final response = await dio.get(AppString.listCurrenciesUrl);
      return ResponseCurrencyModel.fromJson(response.data);
    } on DioError catch (e) {
      print("--------errors Currency${e.error.toString()}");
      print("--------statuscode Currency${e.response}");
      throw ExceptionService();
    }
  }

  @override
  Future<ResponseCountriesEntity> fetchAllCountries() async {
    try {
      final response = await dio.get(AppString.listCountryUrl);
      return ResponseCountriesModel.fromJson(response.data);
    } on DioError catch (e) {
      print("--------errors Countries ${e.error.toString()}");
      print("--------statuscode Countries ${e.response}");
      throw ExceptionService();
    }
  }

  @override
  Future<ResponseCountryCodeEntity> fetchCodeCountry() async {
    try {
      final response = await dio.get("https://flagcdn.com/en/codes.json");
      return ResponseCountryCodeModel.fromJson(response.data);
    } on DioError catch (e) {
      print("--------errors Countries ${e.error.toString()}");
      print("--------statuscode Countries ${e.response}");

      throw ExceptionService();
    }
  }

  @override
  Future<ConverterModel> converterTwoCurrencies(
      String firstCurrencyId, String secondCurrencyId) async {
    try {
      Map<String, dynamic> map = {};
      final response = await dio.get(
          "/api/v7/convert?q=${firstCurrencyId}_PHP,PHP_$secondCurrencyId&compact=ultra&callback=sampleCallback&apiKey=${AppString.ApiKey}");
      var data = response.data.toString();
      var dataSplit = data.split("&&");
      var dataSplit2 = dataSplit[1].substring(15);
      var dataSplit3 = dataSplit2.split(",");
      var firstValue = dataSplit3[0].substring(12);
      var secondValue = dataSplit3[1].substring(10);
      var secondValueReplace = secondValue.replaceAll("}", "");
      var secondValueReplaceFinished = secondValueReplace.replaceAll(");", "");
      ConverterModel converterModel = ConverterModel.fromJson(
          json: response.data,
          firstCurrencyId: firstValue,
          secondCurrencyId: secondValueReplaceFinished);
      return converterModel;
    } on DioError catch (e) {
      print("--------errors Countries ${e.error.toString()}");
      print("--------statuscode Countries ${e.response}");

      throw ExceptionService();
    }
  }

  @override
  Future<List<Map<String, dynamic>>> historicalCurrencies() async {
    try {
      List<Map<String, dynamic>> historicConverterModelList = [];
      for (int i = 1; i <= 7; i++) {
        DateTime yesterdayFromDate = DateTime.now().subtract(Duration(days: i));
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        String date = formatter.format(yesterdayFromDate);
        final response = await dio.get(
            "/api/v7/convert?q=USD_PHP,PHP_USD&compact=ultra&date=${date}&apiKey=${AppString.ApiKey}");

        historicConverterModelList.add(response.data);
      }
      historicConverterModelList
          .map((e) => HistoricalModel.fromJson(e, e['USD_PHP']));
      return historicConverterModelList;
    } on DioError catch (e) {
      print("--------errors Countries ${e.error.toString()}");
      print("--------statuscode Countries ${e.response}");

      throw ExceptionService();
    }
  }

  // TODO:  SOLVING BY SAMPLE CASE //////////////
  // solving multi requests problem with Sample Case solution.
  // @override
  // Future<ResponseCountryCurrencyEntity> fetchAllCountriesCurrencyFlags() async {
  //   Dio dio = Dio();
  //   try {
  //     List<String> currencyIdList = [];
  //     List<String> currencyCountryIdList = [];
  //     List<String> countryIdList = [];
  //     List<CountryCurrencyModel> items = [];
  //     final currenciesResponse = await dio.get(
  //         "https://free.currconv.com/api/v7/currencies?apiKey=797b37664a3d10ec32d3");
  //     ResponseCurrencyModel currencyModel =
  //         ResponseCurrencyModel.fromJson(currenciesResponse.data);
  //     final countryResponse = await dio.get(
  //         "https://free.currconv.com/api/v7/countries?apiKey=797b37664a3d10ec32d3");
  //     ResponseCountriesModel countryModel =
  //         ResponseCountriesModel.fromJson(countryResponse.data);
  //     final codeCountryResponse =
  //         await dio.get("https://flagcdn.com/en/codes.json");
  //     ResponseCountryCodeModel codeCountry =
  //         ResponseCountryCodeModel.fromJson(codeCountryResponse.data);
  //     for (var idCurrency in currencyModel.currencies.currencyMap) {
  //       currencyIdList.add(idCurrency.id);
  //     }
  //     for (var currencyCountryId
  //         in countryModel.mapCountriesEntity.countriesMap) {
  //       currencyCountryIdList.add(currencyCountryId.currencyId);
  //     }
  //     for (var countryId in codeCountry.countriesCodesEntity) {
  //       countryIdList.add(countryId.code);
  //     }
  //     var list = countryModel.mapCountriesEntity.countriesMap.where(
  //         (countryEntity) =>
  //             currencyIdList.contains(countryEntity.currencyId) &&
  //             countryIdList.contains(countryEntity.id.toLowerCase()));
  //     for (var i in list) {
  //       items.add(CountryCurrencyModel(
  //           currencyId: i.currencyId,
  //           country_code_id: i.id.toLowerCase(),
  //           country_image_code_Id:
  //               "https://flagcdn.com/16x12/${i.id.toLowerCase()}.png",
  //           countryName: i.name,
  //           currencyName: i.currencyName,
  //           currencySymbol: i.currencySymbol));
  //     }
  //     return ResponseCountryCurrency(countryCurrencyEntityList: items);
  //   } on DioError catch (e) {
  //     print("--------errors Countries ${e.error.toString()}");
  //     print("--------statuscode Countries ${e.response}");
  //     throw ExceptionService();
  //   }
  // }

  //TODO: SOLVING BY FUTURE.WAIT
  // solving multi requests problem with future.wait() solution.
  // @override
  // Future<ResponseCountryCurrencyEntity>
  //     fetchAllCountriesCurrencyFlags() async {
  //   Dio dio = Dio();
  //   try {
  //     List<String> currencyIdList = [];
  //     List<String> currencyCountryIdList = [];
  //     List<String> countryIdList = [];
  //     List<CountryCurrencyModel> items = [];
  //     List<Response> multiResponse = await Future.wait([
  //       dio.get(
  //           "https://free.currconv.com/api/v7/currencies?apiKey=797b37664a3d10ec32d3"),
  //       dio.get(
  //           "https://free.currconv.com/api/v7/countries?apiKey=797b37664a3d10ec32d3"),
  //       dio.get("https://flagcdn.com/en/codes.json"),
  //     ]);
  //     ResponseCurrencyModel currencyModel =
  //         ResponseCurrencyModel.fromJson(multiResponse[0].data);
  //     ResponseCountriesModel countryModel =
  //         ResponseCountriesModel.fromJson(multiResponse[1].data);
  //     ResponseCountryCodeModel codeCountry =
  //         ResponseCountryCodeModel.fronJson(multiResponse[2].data);
  //     for (var idCurrency in currencyModel.currencies.currencyMap) {
  //       currencyIdList.add(idCurrency.id);
  //     }
  //     for (var currencyCountryId
  //         in countryModel.mapCountriesEntity.countriesMap) {
  //       currencyCountryIdList.add(currencyCountryId.currencyId);
  //     }
  //     for (var countryId in codeCountry.countriesCodesEntity) {
  //       countryIdList.add(countryId.code);
  //     }
  //     var list = countryModel.mapCountriesEntity.countriesMap.where(
  //         (countryEntity) =>
  //             currencyIdList.contains(countryEntity.currencyId) &&
  //             countryIdList.contains(countryEntity.id.toLowerCase()));
  //     for (var i in list) {
  //       items.add(CountryCurrencyModel(
  //           currencyId: i.currencyId,
  //           country_code_id: i.id.toLowerCase(),
  //           country_image_code_Id:
  //               "https://flagcdn.com/16x12/${i.id.toLowerCase()}.png",
  //           countryName: i.name,
  //           currencyName: i.currencyName,
  //           currencySymbol: i.currencySymbol));
  //     }
  //     return ResponseCountryCurrency(countryCurrencyEntityList: items);
  //   } on DioError catch (e) {
  //     print("--------errors Countries ${e.error.toString()}");
  //     print("--------statuscode Countries ${e.response}");
  //     throw ExceptionService();
  //   }
  // }

}

class HistoricalModel {
  final String firstCurrency;
  final String secondCurrency;
  final String date;

  HistoricalModel(
      {required this.firstCurrency,
      required this.secondCurrency,
      required this.date});

  factory HistoricalModel.fromJson(
          Map<String, dynamic> json, String dateTime) =>
      HistoricalModel(
          firstCurrency: json['USD_PHP'][dateTime],
          secondCurrency: json['PHP_USD'][dateTime],
          date: dateTime);
}
