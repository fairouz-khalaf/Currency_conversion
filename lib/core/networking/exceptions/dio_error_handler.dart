import 'package:dio/dio.dart';

import 'app_exception.dart';
import 'error_response.dart';
import 'network_exception_type.dart';

class DioErrorHandler {
  const DioErrorHandler();

  static AppException handle(dynamic e) {
    if (e is DioException) {
      return _handleDioError(e);
    } else {
      return const NetworkException(type: NetworkExceptionType.UNKNOWN);
    }
  }

  static AppException _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.badResponse:
        return _dioBadResponseExceptionToAppException(error);
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException(
          type: NetworkExceptionType.CONNECTION_TIMEOUT,
          code: error.response?.statusCode,
        );
      case DioExceptionType.cancel:
        return const NetworkException(type: NetworkExceptionType.CANCEL);
      case DioExceptionType.connectionError:
        return const NetworkException(
            type: NetworkExceptionType.NO_INTERNET_CONNECTION);
      case DioExceptionType.badCertificate:
        return const NetworkException(
            type: NetworkExceptionType.BAD_CERTIFICATE);
      case DioExceptionType.unknown:
        return const NetworkException(type: NetworkExceptionType.UNKNOWN);
    }
  }

  static NetworkException _dioBadResponseExceptionToAppException(
      DioException error) {
    final statusCode = error.response?.statusCode;
    return switch (statusCode) {
      500 || 502 => const NetworkException(type: NetworkExceptionType.INTERNAL),
      503 =>
        const NetworkException(type: NetworkExceptionType.SERVICE_UNAVAILABLE),
      400 => const NetworkException(type: NetworkExceptionType.BAD_REQUEST),
      401 => const NetworkException(type: NetworkExceptionType.UNAUTHORIZED),
      _ => _backendErrorResponseToAppException(error)
    };
  }

  static NetworkException _backendErrorResponseToAppException(
      DioException error) {
    return error.response != null
        ? NetworkException(
            type: NetworkExceptionType.BACKEND,
            code: error.response!.statusCode,
            message: ErrorResponse.fromJson(
                    error.response!.data as Map<String, dynamic>)
                .message,
          )
        : const NetworkException(type: NetworkExceptionType.UNKNOWN);
  }
}
