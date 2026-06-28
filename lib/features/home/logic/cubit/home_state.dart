import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager_test/core/network/api_error_model.dart';
import 'package:task_manager_test/features/home/data/models/product_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.homeInitial() = HomeInitial;
  const factory HomeState.homeLoading() = HomeLoading;
  const factory HomeState.homeSuccess({
    required List<ProductModel> products,
    required int total,
    String? searchQuery,
  }) = HomeSuccess;
  const factory HomeState.homeError({
    required ApiErrorModel apiErrorModel,
  }) = HomeError;
}
