import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:task_manager_test/core/network/api_error_handler.dart';
import 'package:task_manager_test/core/network/api_result.dart';
import 'package:task_manager_test/core/network/api_service.dart';
import 'package:task_manager_test/features/login/data/models/login_response_body.dart';

class LoginRepo {
  final ApiService _apiService;
  LoginRepo(this._apiService);
  Future<ApiResult<LoginResponseBody>> loginUser({
    required FormData formData,
  }) async {
    try {
      final response = await _apiService.loginUser(formData);
      return ApiResult.success(response);
    } catch (error) {
      log(error.toString());
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
