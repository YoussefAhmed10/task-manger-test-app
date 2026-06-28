import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';
import 'package:task_manager_test/core/theming/app_text_style.dart';
import 'package:task_manager_test/core/theming/app_theme_extension.dart';
import 'package:task_manager_test/core/widget/app_text_button.dart';
import 'package:task_manager_test/features/add_product/logic/cubit/add_product_cubit.dart';
import 'package:task_manager_test/features/add_product/logic/cubit/add_product_state.dart';

class AddProductSubmitButtonWidget extends StatelessWidget {
  const AddProductSubmitButtonWidget({
    super.key,
    required this.onSubmit,
  });

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final colors = context.appTheme;

    return BlocBuilder<AddProductCubit, AddProductState>(
      builder: (context, state) {
        if (state is AddProductLoading) {
          return Container(
            width: double.infinity,
            height: 56.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              gradient: LinearGradient(
                colors: [colors.primary, colors.primaryLight],
              ),
            ),
            child: const Center(
              child: CircularProgressIndicator(color: AppColors.whiteColor),
            ),
          );
        }

        return SizedBox(
          width: double.infinity,
          child: AppTextButton(
            buttonText: 'Add Product',
            textStyle: AppTextStyle.fon16WhiteBold,
            onTap: onSubmit,
            buttonWidth: 375,
          ),
        );
      },
    );
  }
}
