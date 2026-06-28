import 'dart:developer';

import 'package:task_manager_test/core/network/api_error_handler.dart';
import 'package:task_manager_test/core/network/api_result.dart';
import 'package:task_manager_test/core/network/api_service.dart';
import 'package:task_manager_test/features/home/data/models/products_response_body.dart';

class ProductsRepo {
  final ApiService _apiService;
  ProductsRepo(this._apiService);

  Future<ApiResult<ProductsResponseBody>> getProducts() async {
    try {
      final response = await _apiService.getProducts();
      return ApiResult.success(response);
    } catch (error) {
      log(error.toString());
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ProductsResponseBody>> searchProducts(String query) async {
    try {
      final response = await _apiService.searchProducts(query);
      return ApiResult.success(response);
    } catch (error) {
      log(error.toString());
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
