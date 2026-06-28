import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';
import 'package:task_manager_test/features/home/logic/cubit/home_cubit.dart';
import 'package:task_manager_test/features/home/logic/cubit/home_state.dart';
import 'package:task_manager_test/features/home/presentation/widget/empty_state_view_widget.dart';
import 'package:task_manager_test/features/home/presentation/widget/home_error_view_widget.dart';
import 'package:task_manager_test/features/home/presentation/widget/product_search_field_widget.dart';
import 'package:task_manager_test/features/home/presentation/widget/products_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Products',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const ProductSearchFieldWidget(),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.darkBlueColor,
                      ),
                    );
                  }
                  if (state is HomeError) {
                    return ErrorView(
                      onRetry: () => context.read<HomeCubit>().refresh(),
                    );
                  }
                  if (state is HomeSuccess) {
                    if (state.products.isEmpty) {
                      return EmptyStateView(
                        searchQuery: state.searchQuery,
                        onRefresh: () => context.read<HomeCubit>().refresh(),
                      );
                    }
                    return ProductsList(
                      products: state.products,
                      total: state.total,
                      searchQuery: state.searchQuery,
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
