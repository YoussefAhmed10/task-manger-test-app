import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';
import 'package:task_manager_test/features/home/data/models/product_model.dart';
import 'package:task_manager_test/features/home/logic/cubit/home_cubit.dart';
import 'package:task_manager_test/features/home/presentation/widget/home_bloc_listener.dart';
import 'package:task_manager_test/features/home/presentation/widget/product_card_widget.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key, required this.products, required this.total});

  final List<ProductModel> products;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeBlocListener(),
        Expanded(
          child: RefreshIndicator(
            color: AppColors.darkBlueColor,
            onRefresh: () => context.read<HomeCubit>().getProducts(),
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              itemCount: products.length,
              separatorBuilder: (_, index) => verticalSpace(16),
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCardWidget(product: product);
              },
            ),
          ),
        ),
      ],
    );
  }
}
