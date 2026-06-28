import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_test/core/network/api_result.dart';
import 'package:task_manager_test/features/home/data/repo/products_repo.dart';
import 'package:task_manager_test/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  static const int minSearchLength = 3;

  ProductsRepo productsRepo;
  HomeCubit(this.productsRepo) : super(const HomeState.homeInitial());

  int _requestId = 0;

  Future<void> getProducts() async {
    final requestId = ++_requestId;
    emit(const HomeState.homeLoading());
    final result = await productsRepo.getProducts();
    if (requestId != _requestId) return;
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

  Future<void> searchProducts(String query) async {
    final trimmedQuery = query.trim();
    if (trimmedQuery.isEmpty || trimmedQuery.length < minSearchLength) {
      return getProducts();
    }

    final requestId = ++_requestId;
    emit(const HomeState.homeLoading());
    final result = await productsRepo.searchProducts(trimmedQuery);
    if (requestId != _requestId) return;
    result.when(
      success: (data) {
        emit(
          HomeState.homeSuccess(
            products: data.products ?? [],
            total: data.total ?? 0,
            searchQuery: trimmedQuery,
          ),
        );
      },
      failure: (error) {
        emit(HomeState.homeError(apiErrorModel: error));
      },
    );
  }

  Future<void> refresh() async {
    final currentState = state;
    if (currentState is HomeSuccess && currentState.searchQuery != null) {
      await searchProducts(currentState.searchQuery!);
    } else {
      await getProducts();
    }
  }
}
