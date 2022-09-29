import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class FailureService extends Failure {
  @override
  List<Object?> get props => [];
}

class FailureOffline extends Failure {
  @override
  List<Object?> get props => [];
}

class FailureEmptyCache extends Failure {
  @override
  List<Object?> get props => [];
}
