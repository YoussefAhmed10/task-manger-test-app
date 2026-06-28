import 'dart:developer';

import 'package:task_manager_test/core/helper/cache_helper.dart';
import 'package:task_manager_test/core/helper/constants.dart';
import 'package:task_manager_test/core/network/api_error_handler.dart';
import 'package:task_manager_test/core/network/api_result.dart';
import 'package:task_manager_test/core/network/api_service.dart';
import 'package:task_manager_test/features/profile/data/models/user_profile_model.dart';

class ProfileRepo {
  final ApiService _apiService;

  ProfileRepo(this._apiService);

  Future<ApiResult<UserProfileModel>> getCurrentUser() async {
    try {
      final response = await _apiService.getCurrentUser();
      return ApiResult.success(response);
    } catch (error) {
      log(error.toString());
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<void> logout() async {
    await SharedPrefHelper.removeSecuredData(SharedPrefKeys.userToken);
    isLoggedInUser = false;
  }
}
