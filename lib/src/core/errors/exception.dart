class ExceptionService implements Exception {
  final String? error;

  ExceptionService({this.error});
}

class ExceptionOffline implements Exception {}

class ExceptionEmptyCache implements Exception {}
