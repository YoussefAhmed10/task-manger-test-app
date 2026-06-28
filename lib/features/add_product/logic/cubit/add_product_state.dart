import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager_test/core/network/api_error_model.dart';
import 'package:task_manager_test/features/product_details/data/models/product_detail_model.dart';

part 'add_product_state.freezed.dart';

@freezed
class AddProductState with _$AddProductState {
  const factory AddProductState.addProductInitial() = AddProductInitial;
  const factory AddProductState.addProductLoading() = AddProductLoading;
  const factory AddProductState.addProductSuccess({
    required ProductDetailModel product,
  }) = AddProductSuccess;
  const factory AddProductState.addProductError({
    required ApiErrorModel apiErrorModel,
  }) = AddProductError;
}
