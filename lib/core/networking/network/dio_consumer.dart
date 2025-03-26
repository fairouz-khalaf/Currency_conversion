import 'package:currency_watch/core/helpers/shared_preferences.dart';
import 'package:dio/dio.dart';


import '../exceptions/dio_error_handler.dart';
import 'base_consumer.dart';

class DioConsumer implements BaseConsumer {
  const DioConsumer(this.dio);

  final Dio dio;


  @override
  Future<Response<T>> get<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    dio.options.headers = headers ?? {};
    return _errorHandlerTryCatch(() async {
      return await dio.get<T>(path,
          queryParameters: queryParameters,
          options: Options(
              followRedirects: false,
              //Will Not Throw Errors
              validateStatus: (status) => true,
              headers: {
                "Accept-Language":
                    SharedPrefHelper.getLanguage() == "en" ? "en-US" : "ar-EG ",
              }));
    });
  }

  @override
  Future<Response<T>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return _errorHandlerTryCatch(() async {
      dio.options.headers = headers ?? {};
      return await dio.post<T>(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(
              followRedirects: false,
              //Will Not Throw Errors
              validateStatus: (status) => true,
              headers: {
                "Accept-Language":
                    SharedPrefHelper.getLanguage() == "en" ? "en-US" : "ar-EG ",
              }));
    });
  }


}

Future<T> _errorHandlerTryCatch<T>(Future<T> Function() function) async {
  try {
    return await function();
  } catch (e) {
    throw DioErrorHandler.handle(e);
  }
}
