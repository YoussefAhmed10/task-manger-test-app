import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';
import 'package:task_manager_test/core/widget/app_text_form_field.dart';
import 'package:task_manager_test/features/add_product/data/models/add_product_request_body.dart';
import 'package:task_manager_test/features/add_product/logic/cubit/add_product_cubit.dart';
import 'package:task_manager_test/features/add_product/presentation/widget/add_product_bloc_listener.dart';
import 'package:task_manager_test/features/add_product/presentation/widget/add_product_submit_button_widget.dart';
import 'package:task_manager_test/features/add_product/presentation/widget/availability_dropdown_widget.dart';
import 'package:task_manager_test/features/add_product/presentation/widget/category_dropdown_widget.dart';

class AddProductFormWidget extends StatefulWidget {
  const AddProductFormWidget({super.key});

  @override
  State<AddProductFormWidget> createState() => AddProductFormWidgetState();
}

class AddProductFormWidgetState extends State<AddProductFormWidget> {
  String? selectedCategory;
  String? selectedAvailability;

  void submitForm() {
    final cubit = context.read<AddProductCubit>();
    if (!cubit.formKey.currentState!.validate()) return;
    if (selectedCategory == null || selectedAvailability == null) {
      cubit.formKey.currentState!.validate();
      return;
    }

    FocusManager.instance.primaryFocus?.unfocus();

    final requestBody = AddProductRequestBody(
      title: cubit.titleController.text.trim(),
      description: cubit.descriptionController.text.trim(),
      category: selectedCategory!,
      price: double.parse(cubit.priceController.text.trim()),
      brand: cubit.brandController.text.trim(),
      availabilityStatus: selectedAvailability!,
      returnPolicy: cubit.returnPolicyController.text.trim(),
    );

    cubit.addProduct(requestBody: requestBody);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddProductCubit>();

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 24.h),
      child: Form(
        key: cubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.darkBlueColor.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: AppColors.darkBlueColor,
                    size: 22.sp,
                  ),
                  horizontalSpace(12),
                  Expanded(
                    child: Text(
                      'Fill in the product details below. All fields are required.',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.darkBlueColor,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(20),
            Text(
              'Basic Information',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.blackColor,
              ),
            ),
            verticalSpace(12),
            AppTextFormField(
              controller: cubit.titleController,
              labelText: 'Title',
              hintText: 'Enter product title',
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),
            verticalSpace(16),
            AppTextFormField(
              controller: cubit.descriptionController,
              labelText: 'Description',
              hintText: 'Enter product description',
              maxLines: 4,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
            ),
            verticalSpace(16),
            AppTextFormField(
              controller: cubit.brandController,
              labelText: 'Brand',
              hintText: 'Enter brand name',
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a brand';
                }
                return null;
              },
            ),
            verticalSpace(20),
            Text(
              'Pricing & Category',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.blackColor,
              ),
            ),
            verticalSpace(12),
            AppTextFormField(
              controller: cubit.priceController,
              labelText: 'Price',
              hintText: 'Enter price (e.g. 9.99)',
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a price';
                }
                final price = double.tryParse(value.trim());
                if (price == null || price <= 0) {
                  return 'Please enter a valid price';
                }
                return null;
              },
            ),
            verticalSpace(16),
            CategoryDropdownWidget(
              selectedCategory: selectedCategory,
              onChanged: (value) => setState(() => selectedCategory = value),
            ),
            verticalSpace(16),
            AvailabilityDropdownWidget(
              selectedAvailability: selectedAvailability,
              onChanged: (value) =>
                  setState(() => selectedAvailability = value),
            ),
            verticalSpace(20),
            Text(
              'Additional Details',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.blackColor,
              ),
            ),
            verticalSpace(12),
            AppTextFormField(
              controller: cubit.returnPolicyController,
              labelText: 'Return Policy',
              hintText: 'e.g. 30 days return policy',
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a return policy';
                }
                return null;
              },
            ),     
            verticalSpace(28),
            AddProductSubmitButtonWidget(onSubmit: submitForm),
            const AddProductBlocListener(),
          ],
        ),
      ),
    );
  }
}
