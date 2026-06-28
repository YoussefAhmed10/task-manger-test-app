import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_test/core/network/api_result.dart';
import 'package:task_manager_test/features/product_details/data/repo/product_details_repo.dart';
import 'package:task_manager_test/features/product_details/logic/cubit/product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductDetailsRepo _productDetailsRepo;

  ProductDetailsCubit(this._productDetailsRepo)
      : super(const ProductDetailsState.productDetailsInitial());

  Future<void> getProductDetails(int id) async {
    emit(const ProductDetailsState.productDetailsLoading());
    final result = await _productDetailsRepo.getProductById(id);
    result.when(
      success: (product) {
        emit(ProductDetailsState.productDetailsSuccess(product: product));
      },
      failure: (error) {
        emit(ProductDetailsState.productDetailsError(apiErrorModel: error));
      },
    );
  }
}
