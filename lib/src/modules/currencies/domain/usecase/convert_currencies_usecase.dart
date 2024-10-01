import 'package:currency_converter_app/src/core/errors/faliure.dart';
import 'package:currency_converter_app/src/modules/currencies/domain/repository/base_repository.dart';
import 'package:currency_converter_app/src/core/base/base_use_case.dart';
import 'package:dartz/dartz.dart';

import '../model/currency_converter_model.dart';
import '../../../../core/base/params.dart';

class ConvertCurrenciesUseCase extends BaseUseCase<Failure ,ConvertCurrenciesUseCaseParams , CurrencyConverterModel>{
  final BaseRepository repository;

  ConvertCurrenciesUseCase({required this.repository});
  
  @override
  Future<Either<Failure, CurrencyConverterModel>> execute({ required ConvertCurrenciesUseCaseParams params}) =>
    repository.converterTwoCurrencies(params );
  
  
}



class ConvertCurrenciesUseCaseParams extends Params {
  final String from , to ; 
  final double amount ;

  ConvertCurrenciesUseCaseParams({required this.from, required this.to, required this.amount});
  
  @override
  Either<Failure, bool> verify() {
    return const Right(true);
  }
}