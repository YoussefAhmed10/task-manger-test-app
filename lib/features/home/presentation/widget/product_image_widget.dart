import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/theming/app_theme_extension.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final colors = context.appTheme;

    if (imageUrl.isEmpty) {
      return ColoredBox(
        color: colors.border,
        child: Icon(
          Icons.image_not_supported_outlined,
          size: 40.sp,
          color: colors.secondaryText,
        ),
      );
    }

    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.contain,
      alignment: Alignment.center,
      progressIndicatorBuilder: (context, child, loadingProgress) {
        return ColoredBox(
          color: colors.border.withValues(alpha: 0.5),
          child: Center(
            child: CircularProgressIndicator(
              color: colors.primary,
              value: loadingProgress.progress != null
                  ? loadingProgress.progress! / 100
                  : null,
            ),
          ),
        );
      },
      errorWidget: (context, error, stackTrace) => ColoredBox(
        color: colors.border,
        child: Icon(
          Icons.broken_image_outlined,
          size: 40.sp,
          color: colors.secondaryText,
        ),
      ),
    );
  }
}
