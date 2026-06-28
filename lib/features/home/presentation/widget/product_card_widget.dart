import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_text_style.dart';
import 'package:task_manager_test/core/theming/app_theme_extension.dart';
import 'package:task_manager_test/features/home/data/models/product_model.dart';
import 'package:task_manager_test/features/home/presentation/widget/product_image_widget.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key, required this.product, this.onTap});

  final ProductModel product;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.appTheme;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(12.r),
      clipBehavior: Clip.antiAlias,
      elevation: Theme.of(context).brightness == Brightness.dark ? 0 : 2,
      shadowColor: colors.shadow,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ProductImage(imageUrl: product.displayImage),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (product.category != null)
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: colors.primaryContainer,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Text(
                              product.category!,
                              style: AppTextStyle.fon12BlackBold.copyWith(
                                color: colors.onPrimaryContainer,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        const Spacer(),
                        Text(
                          '\$${product.price?.toStringAsFixed(2) ?? '—'}',
                          style: AppTextStyle.fon16WhiteBold.copyWith(
                            color: colors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(8),
                    Text(
                      product.title ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: colors.primaryText,
                        height: 1.3,
                      ),
                    ),
                    verticalSpace(6),
                    Text(
                      product.description ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: colors.secondaryText,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
        ),
      ),
    );
  }
}
