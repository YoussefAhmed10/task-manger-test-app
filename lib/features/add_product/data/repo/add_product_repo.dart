import 'dart:developer';

import 'package:task_manager_test/core/network/api_error_handler.dart';
import 'package:task_manager_test/core/network/api_result.dart';
import 'package:task_manager_test/core/network/api_service.dart';
import 'package:task_manager_test/features/add_product/data/models/add_product_request_body.dart';
import 'package:task_manager_test/features/product_details/data/models/product_detail_model.dart';

class AddProductRepo {
  final ApiService _apiService;

  AddProductRepo(this._apiService);

  Future<ApiResult<ProductDetailModel>> addProduct({
    required AddProductRequestBody requestBody,
  }) async {
    try {
      final response = await _apiService.addProduct(requestBody);
      return ApiResult.success(response);
    } catch (error) {
      log(error.toString());
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
