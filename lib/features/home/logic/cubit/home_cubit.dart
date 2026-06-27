import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_test/core/network/api_result.dart';
import 'package:task_manager_test/features/home/data/repo/products_repo.dart';
import 'package:task_manager_test/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  ProductsRepo productsRepo;
  HomeCubit(this.productsRepo) : super(const HomeState.homeInitial());

  Future<void> getProducts() async {
    emit(const HomeState.homeLoading());
    final result = await productsRepo.getProducts();
    result.when(
      success: (data) {
        emit(
          HomeState.homeSuccess(
            products: data.products ?? [],
            total: data.total ?? 0,
          ),
        );
      },
      failure: (error) {
        emit(HomeState.homeError(apiErrorModel: error));
      },
    );
  }
}
