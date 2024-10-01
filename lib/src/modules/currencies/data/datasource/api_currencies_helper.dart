import 'package:dio/dio.dart';

import '../../../../core/network/api_helper.dart';

// ignore: must_be_immutable
class CurrenciesApiHelper extends ApiHelper {

  @override
  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.get<dynamic>(url,
        queryParameters: query,
        options: Options(
            headers: dio.options.headers
              ..addAll(headers ?? <String, dynamic>{})));
  }
  @override
  Future<Response> postData({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.post<dynamic>(url,
        data: body,
        queryParameters: query,
        options: Options(
            headers: dio.options.headers
              ..addAll(headers ?? <String, dynamic>{})));
  }
  @override
  List<Object?> get props => [];
}

