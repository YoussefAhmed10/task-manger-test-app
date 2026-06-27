// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:task_manager_test/core/helper/cache_helper.dart';
import 'package:task_manager_test/core/helper/constants.dart';
import 'package:task_manager_test/core/helper/global_navigator.dart';
import 'package:task_manager_test/core/routing/routes.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "Connection to server failed");
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "Request to the server was cancelled");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "Connection timeout with the server");
        case DioExceptionType.unknown:
          return ApiErrorModel(
            message:
                "Connection to the server failed due to internet connection",
          );
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            message: "Receive timeout in connection with the server",
          );
        case DioExceptionType.badResponse:
          return _handleError(
            dataError: error.response?.data,
            statusCode: error.response?.statusCode,
          );
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
            message: "Send timeout in connection with the server",
          );
        default:
          return ApiErrorModel(message: "Something went wrong");
      }
    } else {
      return ApiErrorModel(message: "Unknown error occurred");
    }
  }
}

String? _extractMessage(dynamic dataError) {
  Map<String, dynamic>? json;

  if (dataError is Map<String, dynamic>) {
    json = dataError;
  } else if (dataError is Map) {
    json = dataError.map((k, v) => MapEntry(k.toString(), v));
  } else if (dataError is String) {
    try {
      final decoded = jsonDecode(dataError);
      if (decoded is Map) {
        json = decoded.map((k, v) => MapEntry(k.toString(), v));
      }
    } catch (_) {}
  }

  final message = json?['message'];
  if (message == null || message.toString().trim().isEmpty) return null;
  return message.toString();
}

ApiErrorModel _handleError({dynamic dataError, int? statusCode}) {
  log('Error: ${statusCode.toString()}');
  final message = _extractMessage(dataError);

  if (statusCode == 401 ||
      message == 'Unauthenticated' ||
      message == 'Unauthenticated.') {
    NavigationServices.navigatorKey.currentState!.pushReplacementNamed(
      Routes.loginScreen,
    );
    SharedPrefHelper.removeSecuredData(SharedPrefKeys.userToken);
    isLoggedInUser = false;
  }

  return ApiErrorModel(message: message ?? 'Something went wrong');
}
