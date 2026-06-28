import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_manager_test/features/add_product/logic/cubit/add_product_cubit.dart';
import 'package:task_manager_test/features/add_product/logic/cubit/add_product_state.dart';
import 'package:task_manager_test/features/add_product/presentation/widget/add_product_success_dialog.dart';

class AddProductBlocListener extends StatelessWidget {
  const AddProductBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddProductCubit, AddProductState>(
      listenWhen: (previous, current) =>
          current is AddProductSuccess || current is AddProductError,
      listener: (context, state) {
        state.whenOrNull(
          addProductSuccess: (product) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (dialogContext) => AddProductSuccessDialog(
                productTitle: product.title ?? 'Product',
                onDone: () {
                  Navigator.of(dialogContext).pop();
                  Navigator.of(context).pop(true);
                },
              ),
            );
          },
          addProductError: (error) => Fluttertoast.showToast(
            msg: error.message ?? 'Failed to add product',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          ),
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
