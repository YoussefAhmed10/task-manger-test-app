import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_test/core/network/api_result.dart';
import 'package:task_manager_test/features/add_product/data/models/add_product_request_body.dart';
import 'package:task_manager_test/features/add_product/data/repo/add_product_repo.dart';
import 'package:task_manager_test/features/add_product/logic/cubit/add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final AddProductRepo addProductRepo;

  AddProductCubit(this.addProductRepo)
      : super(const AddProductState.addProductInitial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController returnPolicyController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  Future<void> addProduct({required AddProductRequestBody requestBody}) async {
    emit(const AddProductState.addProductLoading());
    final result = await addProductRepo.addProduct(requestBody: requestBody);
    result.when(
      success: (product) {
        emit(AddProductState.addProductSuccess(product: product));
      },
      failure: (error) {
        emit(AddProductState.addProductError(apiErrorModel: error));
      },
    );
  }

  void resetForm() {
    titleController.clear();
    descriptionController.clear();
    priceController.clear();
    brandController.clear();
    returnPolicyController.clear();
    imageUrlController.clear();
    emit(const AddProductState.addProductInitial());
  }

  @override
  Future<void> close() {
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    brandController.dispose();
    returnPolicyController.dispose();
    imageUrlController.dispose();
    return super.close();
  }
}
