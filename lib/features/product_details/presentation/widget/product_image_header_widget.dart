import 'package:flutter/material.dart';
import 'package:task_manager_test/core/theming/app_theme_extension.dart';
import 'package:task_manager_test/features/home/presentation/widget/product_image_widget.dart';

class ProductImageHeaderWidget extends StatelessWidget {
  const ProductImageHeaderWidget({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final colors = context.appTheme;

    return Container(
      color: colors.surface,
      child: AspectRatio(
        aspectRatio: 1,
        child: ProductImage(imageUrl: imageUrl),
      ),
    );
  }
}
