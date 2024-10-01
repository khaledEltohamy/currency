import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../entities/supported_currencies_entity.dart';


abstract class BaseLocalDataSource extends Equatable {
  Future<Unit> cachedSupportedCurrenciesModelListLocal(ResponseSupportedCurrenciesEntity model);
  Future<ResponseSupportedCurrenciesEntity> getSupportedCurrenciesModelListLocal();
}