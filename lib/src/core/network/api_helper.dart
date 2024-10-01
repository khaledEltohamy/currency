import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
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
    );

    dio = Dio(options);
    
  }
  Future<Response> postData({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  });
  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  });
 @override
  List<Object?> get props => [];
}
