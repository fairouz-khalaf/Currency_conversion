import 'package:dio/dio.dart';

abstract class BaseConsumer {
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Object? data,
  });

  Future<Response<T>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });


}
