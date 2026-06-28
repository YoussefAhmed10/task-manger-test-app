import 'dart:developer';

import 'package:task_manager_test/core/network/api_error_handler.dart';
import 'package:task_manager_test/core/network/api_result.dart';
import 'package:task_manager_test/core/network/api_service.dart';
import 'package:task_manager_test/features/product_details/data/models/product_detail_model.dart';

class ProductDetailsRepo {
  final ApiService _apiService;

  ProductDetailsRepo(this._apiService);

  Future<ApiResult<ProductDetailModel>> getProductById(int id) async {
    try {
      final response = await _apiService.getProductById(id);
      return ApiResult.success(response);
    } catch (error) {
      log(error.toString());
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
