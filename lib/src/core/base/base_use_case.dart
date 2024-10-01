import 'package:currency_converter_app/src/core/errors/faliure.dart';
import 'package:currency_converter_app/src/core/base/params.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<F extends Failure  , P extends Params , T> {
  Future<Either<F ,T>> execute({required P params});
}
class NoParams extends Params {
  @override
  Either<Failure, bool> verify() {
  return const Right(true);
  }
}