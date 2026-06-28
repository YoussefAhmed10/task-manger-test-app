import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_manager_test/features/product_details/logic/cubit/product_details_cubit.dart';
import 'package:task_manager_test/features/product_details/logic/cubit/product_details_state.dart';

class ProductDetailsBlocListener extends StatelessWidget {
  const ProductDetailsBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductDetailsCubit, ProductDetailsState>(
      listenWhen: (previous, current) => current is ProductDetailsError,
      listener: (context, state) {
        state.whenOrNull(
          productDetailsError: (error) => Fluttertoast.showToast(
            msg: error.message ?? 'Failed to load product details',
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
