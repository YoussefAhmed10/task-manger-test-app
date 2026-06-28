import 'package:flutter/material.dart';
import 'package:task_manager_test/features/add_product/data/constants/product_categories.dart';
import 'package:task_manager_test/features/add_product/presentation/widget/add_product_dropdown_field_widget.dart';

class CategoryDropdownWidget extends StatelessWidget {
  const CategoryDropdownWidget({
    super.key,
    required this.selectedCategory,
    required this.onChanged,
  });

  final String? selectedCategory;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return AddProductDropdownFieldWidget(
      label: 'Category',
      hint: 'Select a category',
      value: selectedCategory,
      items: ProductCategories.all,
      displayBuilder: ProductCategories.displayName,
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a category';
        }
        return null;
      },
    );
  }
}
