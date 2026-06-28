import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager_test/core/network/api_error_model.dart';
import 'package:task_manager_test/features/product_details/data/models/product_detail_model.dart';

part 'product_details_state.freezed.dart';

@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState.productDetailsInitial() =
      ProductDetailsInitial;
  const factory ProductDetailsState.productDetailsLoading() =
      ProductDetailsLoading;
  const factory ProductDetailsState.productDetailsSuccess({
    required ProductDetailModel product,
  }) = ProductDetailsSuccess;
  const factory ProductDetailsState.productDetailsError({
    required ApiErrorModel apiErrorModel,
  }) = ProductDetailsError;
}
