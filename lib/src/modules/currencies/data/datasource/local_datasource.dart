import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/strings/app_strings.dart';
import '../../../../core/errors/exception.dart';
import '../model/country_currency_model.dart';

abstract class BaseLocalDataSource extends Equatable {
  Future<Unit> cachedCountryCurrencyListLocal(
      List<CountryCurrencyModel> userModelResponse);
  Future<List<CountryCurrencyModel>> getCountryCurrencyListLocal();
}

class SharedPefLocalDataSourceImp extends BaseLocalDataSource {
  final SharedPreferences sharedPreferences;

  SharedPefLocalDataSourceImp({required this.sharedPreferences});

  @override
  List<Object?> get props => [];

  @override
  Future<Unit> cachedCountryCurrencyListLocal(
      List<CountryCurrencyModel> countryCurrencyModel) async {
    List<String> listCountryCurrency = countryCurrencyModel
        .map((countryCurrency) => jsonEncode(countryCurrency.toJson()))
        .toList();
    await sharedPreferences.setStringList(
        AppString.cachedCountryCurrencyKey, listCountryCurrency);
    return Future.value(unit);
  }

  @override
  Future<List<CountryCurrencyModel>> getCountryCurrencyListLocal() {
    List<String> countryCurrencyCached =
        sharedPreferences.getStringList(AppString.cachedCountryCurrencyKey)!;
    if (countryCurrencyCached != null) {
      var decodeData = json.decode(countryCurrencyCached.toString());
      List<CountryCurrencyModel> cachedData = List<CountryCurrencyModel>.from(
          decodeData.map((model) => CountryCurrencyModel.fromJson(model)));
      return Future.value(cachedData);
    } else {
      throw ExceptionEmptyCache();
    }
  }
}
