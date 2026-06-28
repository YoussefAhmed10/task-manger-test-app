import 'package:flutter/material.dart';
import 'package:task_manager_test/features/add_product/data/constants/product_availability_options.dart';
import 'package:task_manager_test/features/add_product/presentation/widget/add_product_dropdown_field_widget.dart';

class AvailabilityDropdownWidget extends StatelessWidget {
  const AvailabilityDropdownWidget({
    super.key,
    required this.selectedAvailability,
    required this.onChanged,
  });

  final String? selectedAvailability;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return AddProductDropdownFieldWidget(
      label: 'Availability Status',
      hint: 'Select availability',
      value: selectedAvailability,
      items: ProductAvailabilityOptions.all,
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select availability status';
        }
        return null;
      },
    );
  }
}
