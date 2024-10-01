import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../core/constants/strings/app_strings.dart';
import '../../../../../core/errors/exception.dart';
import '../../entities/supported_currencies_entity.dart';
import 'base_local_datasource.dart';



class LocalDataSourceImp extends BaseLocalDataSource {
  final box = Hive.box(AppString.cachedCurrencyBoxKey);
  
  @override
  List<Object?> get props => [];

  @override
  Future<Unit> cachedSupportedCurrenciesModelListLocal(
      ResponseSupportedCurrenciesEntity model) async {
    
    List<String> listSupportedCurrencies = model.supportedCurrencies
        .map((supportedCurrency) => jsonEncode(supportedCurrency.toJson()))
        .toList();
    await  box.put(AppString.cachedCurrencyKey, listSupportedCurrencies);
    return Future.value(unit);
  }

  @override
  Future<ResponseSupportedCurrenciesEntity> getSupportedCurrenciesModelListLocal() {
    List<String>? supportedCurrenciesCached  = box.get(AppString.cachedCurrencyKey);
    if (supportedCurrenciesCached != null && supportedCurrenciesCached.isNotEmpty) {
      var decodeData = json.decode(supportedCurrenciesCached.toString());
      List<SupportedCurrenciesEntity> cachedData = List<SupportedCurrenciesEntity>.from(
          decodeData.map((model) => SupportedCurrenciesEntity.fromJson(model)));
      return Future.value(ResponseSupportedCurrenciesEntity(supportedCurrencies: cachedData));
    } else {
      throw ExceptionEmptyCache();
    }
  }
}
