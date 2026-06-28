import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';
import 'package:task_manager_test/features/home/logic/cubit/home_cubit.dart';

class ProductSearchFieldWidget extends StatefulWidget {
  const ProductSearchFieldWidget({super.key});

  @override
  State<ProductSearchFieldWidget> createState() =>
      _ProductSearchFieldWidgetState();
}

class _ProductSearchFieldWidgetState extends State<ProductSearchFieldWidget> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onQueryChanged(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      final trimmed = query.trim();
      if (trimmed.length >= HomeCubit.minSearchLength) {
        context.read<HomeCubit>().searchProducts(trimmed);
      } else {
        context.read<HomeCubit>().getProducts();
      }
    });
  }

  void _onSearch(String query) {
    _debounce?.cancel();
    final trimmed = query.trim();
    if (trimmed.length >= HomeCubit.minSearchLength) {
      context.read<HomeCubit>().searchProducts(trimmed);
    }
  }

  void _onClear() {
    _debounce?.cancel();
    _controller.clear();
    context.read<HomeCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 8.h),
      child: TextField(
        controller: _controller,
        cursorColor: AppColors.darkBlueColor,
        textInputAction: TextInputAction.search,
        onChanged: _onQueryChanged,
        onSubmitted: _onSearch,
        style: TextStyle(
          fontSize: 15.sp,
          color: AppColors.blackColor,
        ),
        decoration: InputDecoration(
          hintText: 'Search products (min 3 characters)...',
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: AppColors.greyColor,
          ),
          filled: true,
          fillColor: AppColors.whiteColor,
          prefixIcon: Icon(
            Icons.search_rounded,
            color: AppColors.greyColor,
            size: 22.sp,
          ),
          suffixIcon: ValueListenableBuilder<TextEditingValue>(
            valueListenable: _controller,
            builder: (context, value, _) {
              if (value.text.isEmpty) return const SizedBox.shrink();
              return IconButton(
                onPressed: _onClear,
                icon: Icon(
                  Icons.close_rounded,
                  color: AppColors.greyColor,
                  size: 20.sp,
                ),
              );
            },
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: AppColors.darkGreyColor.withValues(alpha: 0.2),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: AppColors.darkGreyColor.withValues(alpha: 0.2),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(
              color: AppColors.darkBlueColor,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
