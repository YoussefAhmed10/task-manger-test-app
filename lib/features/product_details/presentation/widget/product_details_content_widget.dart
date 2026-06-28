import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';
import 'package:task_manager_test/features/product_details/data/models/product_detail_model.dart';
import 'package:task_manager_test/features/product_details/presentation/widget/info_card_widget.dart';
import 'package:task_manager_test/features/product_details/presentation/widget/product_header_info_widget.dart';
import 'package:task_manager_test/features/product_details/presentation/widget/product_image_header_widget.dart';
import 'package:task_manager_test/features/product_details/presentation/widget/product_reviews_section_widget.dart';

class ProductDetailsContentWidget extends StatelessWidget {
  const ProductDetailsContentWidget({super.key, required this.product});

  final ProductDetailModel product;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ProductImageHeaderWidget(imageUrl: product.displayImage),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 32.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductHeaderInfoWidget(product: product),
                verticalSpace(20),
                InfoCardWidget(
                  icon: Icons.description_outlined,
                  title: 'Description',
                  child: Text(
                    product.description ?? '',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.lightBlackColor,
                      height: 1.6,
                    ),
                  ),
                ),
                verticalSpace(24),
                ProductReviewsSectionWidget(product: product),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
