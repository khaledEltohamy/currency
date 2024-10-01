import 'package:dartz/dartz.dart';

import '../errors/faliure.dart';

abstract class Params {
  Either<Failure, bool> verify();
}