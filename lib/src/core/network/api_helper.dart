import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../constants/strings/app_strings.dart';

abstract class ApiHelper extends Equatable {
  late Dio dio;
  late BaseOptions options;
  ApiHelper() {
    options = BaseOptions(
      responseType: ResponseType.json,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      baseUrl: AppString.baseCurrenciesUrl,
    );

    dio = Dio(options);
  }
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class CurrenciesApiHelper extends ApiHelper {}
