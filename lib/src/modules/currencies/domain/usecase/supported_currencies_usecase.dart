
import 'package:currency_converter_app/src/core/errors/faliure.dart';
import 'package:currency_converter_app/src/modules/currencies/domain/model/supported_currencies_model.dart';
import 'package:currency_converter_app/src/modules/currencies/domain/repository/base_repository.dart';
import 'package:currency_converter_app/src/core/base/base_use_case.dart';
import 'package:dartz/dartz.dart';

class SupportedCurrenciesUsecase extends BaseUseCase<Failure , NoParams , ResponseSupportedCurrenciesModel> {
  final BaseRepository repository;

  SupportedCurrenciesUsecase({required this.repository});
  
  @override
  Future<Either<Failure, ResponseSupportedCurrenciesModel>> execute({required NoParams params}) => repository.fetchsupportedCurrencies();

  

}

