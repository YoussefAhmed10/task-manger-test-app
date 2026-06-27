// ignore_for_file: constant_identifier_names, non_constant_identifier_names

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

Map<String, dynamic>? _asStringKeyMap(dynamic data) {
  if (data is Map<String, dynamic>) return data;
  if (data is Map) {
    return data.map((k, v) => MapEntry(k.toString(), v));
  }
  return null;
}

String _resolveErrorMessage(Map<String, dynamic> data) {
  final direct = data['message'];
  if (direct != null && direct.toString().trim().isNotEmpty) {
    return direct.toString();
  }

  return 'Something went wrong';
}

ApiErrorModel _handleError({dynamic dataError, int? statusCode}) {
  log('Error: ${statusCode.toString()}');
  final data = _asStringKeyMap(dataError);
  if (statusCode == 401 ||
      (data != null &&
          (data['message'] == 'Unauthenticated' ||
              data['message'] == 'Unauthenticated.'))) {
    NavigationServices.navigatorKey.currentState!.pushReplacementNamed(
      Routes.loginScreen,
    );
    SharedPrefHelper.removeSecuredData(SharedPrefKeys.userToken);
    isLoggedInUser = false;
  }
  if (data == null) {
    return ApiErrorModel(message: 'Something went wrong');
  }
  return ApiErrorModel(message: _resolveErrorMessage(data));
}
