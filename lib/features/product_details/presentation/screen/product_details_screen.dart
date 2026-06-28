import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';
import 'package:task_manager_test/features/product_details/logic/cubit/product_details_cubit.dart';
import 'package:task_manager_test/features/product_details/logic/cubit/product_details_state.dart';
import 'package:task_manager_test/features/product_details/presentation/widget/product_details_bloc_listener.dart';
import 'package:task_manager_test/features/product_details/presentation/widget/product_details_content_widget.dart';
import 'package:task_manager_test/features/product_details/presentation/widget/product_details_error_view_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductDetailsCubit>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            _ProductDetailsAppBar(
              onBack: () => Navigator.of(context).pop(),
            ),
            const ProductDetailsBlocListener(),
            Expanded(
              child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                builder: (context, state) {
                  if (state is ProductDetailsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.darkBlueColor,
                      ),
                    );
                  }
                  if (state is ProductDetailsError) {
                    return ProductDetailsErrorView(
                      onRetry: () => context
                          .read<ProductDetailsCubit>()
                          .getProductDetails(widget.productId),
                    );
                  }
                  if (state is ProductDetailsSuccess) {
                    return ProductDetailsContentWidget(
                      product: state.product,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductDetailsAppBar extends StatelessWidget {
  const _ProductDetailsAppBar({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Row(
        children: [
          IconButton(
            onPressed: onBack,
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20.sp,
              color: AppColors.blackColor,
            ),
          ),
          Text(
            'Product Details',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
