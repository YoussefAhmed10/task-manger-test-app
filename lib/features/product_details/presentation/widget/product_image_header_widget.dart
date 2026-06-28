import 'package:flutter/material.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';
import 'package:task_manager_test/features/home/presentation/widget/product_image_widget.dart';

class ProductImageHeaderWidget extends StatelessWidget {
  const ProductImageHeaderWidget({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: AspectRatio(
        aspectRatio: 1,
        child: ProductImage(imageUrl: imageUrl),
      ),
    );
  }
}
