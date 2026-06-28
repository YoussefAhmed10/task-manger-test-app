import 'package:flutter/material.dart';
import 'package:task_manager_test/core/widget/keyboard_dismiss_wrapper.dart';
import 'package:task_manager_test/features/add_product/presentation/widget/add_product_app_bar_widget.dart';
import 'package:task_manager_test/features/add_product/presentation/widget/add_product_form_widget.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissWrapper(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: SafeArea(
          child: Column(
            children: [
              AddProductAppBarWidget(
                onBack: () => Navigator.of(context).pop(),
              ),
              const Expanded(child: AddProductFormWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
