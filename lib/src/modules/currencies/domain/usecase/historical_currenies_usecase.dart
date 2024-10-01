import 'package:currency_converter_app/src/modules/currencies/domain/model/historical_currencies_model.dart';
import 'package:currency_converter_app/src/modules/currencies/domain/repository/base_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/faliure.dart';
import '../../../../core/base/base_use_case.dart';

class HistoricalCurreniesUsecase extends BaseUseCase<Failure , NoParams , ResponseHistoricalCurrenciesModel>{
  final BaseRepository repository;

  HistoricalCurreniesUsecase({required this.repository});
  @override
  Future<Either<Failure, ResponseHistoricalCurrenciesModel>> execute({required NoParams params}) 
  => repository.historicalCurrencies();
}