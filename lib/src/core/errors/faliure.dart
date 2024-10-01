import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

// ignore: must_be_immutable
class FailureService extends Failure {
  String? error;
  @override
  List<Object?> get props => [error];
}

class FailureOffline extends Failure {
  @override
  List<Object?> get props => [];
}

class FailureEmptyCache extends Failure {
  @override
  List<Object?> get props => [];
}
