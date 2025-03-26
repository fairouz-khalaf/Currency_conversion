// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:currency_watch/core/helpers/extensions.dart';
import 'package:currency_watch/core/helpers/shared_preferences.dart';
import 'package:currency_watch/core/networking/exceptions/app_exception_extension.dart';
import 'package:currency_watch/core/networking/network/result.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../di/dependency_injection.dart';
import '../../helpers/main_functions.dart';
import '../../routing/named_router.dart';
import '../exceptions/api_error_model.dart';
import '../exceptions/app_exception.dart';
import '../exceptions/dio_error_handler.dart';
import 'base_consumer.dart';

enum ServerMethods { GET, POST, UPDATE, DELETE, PUT, PATCH }

/// custom network call function ///
Future<Result<T>> networkCall<T>({
  required ServerMethods method,
  required String path,
  Map<String, dynamic>? params,
  Map<String, dynamic>? headers,
  dynamic data,
  required T Function(dynamic) fromJson,
  Function(Response?)? successHandler,
  Function(dynamic)? errorHandler,
}) async {
  try {
    final response = await _executeApiCall(method, path, headers, params, data);
    return _handleResponse<T>(response, fromJson, errorHandler, successHandler);
  } catch (e) {
    return _handleApiError(e, errorHandler);
  }
}

/// CALL API WITH METHOD ///
Future<Response<T>> _executeApiCall<T>(
    ServerMethods method,
    String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    dynamic data) async {
  switch (method) {
    case ServerMethods.GET:
      return await getIt<BaseConsumer>()
          .get<T>(path, queryParameters: params, headers: headers);
    case ServerMethods.POST:
      return await getIt<BaseConsumer>()
          .post<T>(path, queryParameters: params, data: data, headers: headers);
    default:
      throw UnimplementedError('Method $method is not implemented');
  }
}

/// HANDLE API RESPONSE ///
Result<T> _handleResponse<T>(Response? response, T Function(dynamic) fromJson,
    Function(dynamic)? errorHandler, Function(Response?)? successHandler) {
  if (response!.data != null && response.statusCode == 200) {
    return _handleSuccess(response, successHandler, fromJson);
    // CHECK IF THE RESPONSE RETURNS UNAUTHORIZED //
  } else if (response.statusCode == 401) {
    GlobalContextExt.globalContext!.pushReplacementNamed(Routes.loginView);
    SharedPrefHelper.clearAllData();
    return customAlertDialog(content: const Text("Session Expired"));
  } else {
    return _handleError(response, errorHandler);
  }
}

/// HANDLE API RESPONSE SUCCESS ///
Result<T> _handleSuccess<T>(response, Function(Response?)? successHandler,
    T Function(dynamic) fromJson) {
  successHandler?.call(response);
  final responseData = fromJson(response.data);
  return Result.success(responseData);
}

/// HANDLE API RESPONSE ERROR ///
Result<T> _handleError<T>(Response? response, Function(dynamic)? errorHandler) {
  log('API call failed with status code: $response', name: 'Error message');
  errorHandler?.call('Server error: $response');
  try {
    if (response != null) {
      var e = ApiErrorModel.fromJson(response.data);

      if ((e.message) != null) {
        return Result.failure(e.message!);
      }
    }
    return Result.failure('Server error: ${response!.statusCode}');
  } catch (e) {
    return Result.failure('Server error: ${response!.statusCode}');
  }
}

/// HANDLE API  SUCCESS ///
Result<T> _handleApiError<T>(dynamic e, Function(dynamic)? errorHandler) {
  if (e is NetworkException) {
    log(e.networkErrorMessage(), name: 'Error message');
    return Result.failure(e.networkErrorMessage());
  }
  final exception = DioErrorHandler.handle(e);
  errorHandler?.call('Server error: $e');
  return Result.failure(exception.message);
}
