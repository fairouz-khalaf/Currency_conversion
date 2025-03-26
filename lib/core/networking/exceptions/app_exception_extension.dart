import 'app_exception.dart';
import 'network_exception_type.dart';

extension NetworkExceptionExtension on NetworkException {
  String networkErrorMessage() {
    return switch (type) {
      NetworkExceptionType.CONNECTION_TIMEOUT => 'Connection timeout',
      NetworkExceptionType.CANCEL => 'Request canceled',
      NetworkExceptionType.NO_INTERNET_CONNECTION => 'No internet connection',
      NetworkExceptionType.BAD_CERTIFICATE => 'Bad certificate',
      NetworkExceptionType.UNKNOWN => 'Unknown error occurred',
      NetworkExceptionType.INTERNAL => 'Internal server error => 500',
      NetworkExceptionType.SERVICE_UNAVAILABLE => 'Service unavailable => 503',
      NetworkExceptionType.BACKEND => 'Backend error occurred',
      NetworkExceptionType.UNAUTHORIZED => 'Unauthorized access => 401',
      NetworkExceptionType.FORBIDDEN => 'Access forbidden => 403',
      NetworkExceptionType.NOT_FOUND => 'Resource not found => 404',
      NetworkExceptionType.CONFLICT => 'Conflict in request = >409',
      NetworkExceptionType.TIME_OUT => 'Request timed out',
      NetworkExceptionType.NO_INTERNET => 'No internet connection available',
      NetworkExceptionType.SUCCESS => 'Success => 200 , 201',
      NetworkExceptionType.NO_CONTENT => 'No content available => 204',
      NetworkExceptionType.BAD_REQUEST => 'Bad request =>400',
      NetworkExceptionType.RECEIVE_TIMEOUT => 'Receive timeout',
      NetworkExceptionType.SEND_TIMEOUT => 'Send timeout',
    };
  }
}

extension CacheExceptionExtension on CacheException {
  String cacheErrorMessage() {
    return 'Cache error';
  }
}
