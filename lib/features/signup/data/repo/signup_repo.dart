import 'dart:developer';

import 'package:task_manager_test/core/network/api_error_handler.dart';
import 'package:task_manager_test/core/network/api_result.dart';
import 'package:task_manager_test/core/network/api_service.dart';
import 'package:task_manager_test/features/signup/data/models/signup_request_body.dart';
import 'package:task_manager_test/features/signup/data/models/signup_response_body.dart';

class SignupRepo {
  final ApiService _apiService;
  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponseBody>> registerUser({
    required SignupRequestBody requestBody,
  }) async {
    try {
      final response = await _apiService.registerUser(requestBody);
      return ApiResult.success(response);
    } catch (error) {
      log(error.toString());
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
