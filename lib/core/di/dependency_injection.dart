import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task_manager_test/core/network/api_service.dart';
import 'package:task_manager_test/core/network/dio_factory.dart';
import 'package:task_manager_test/features/home/data/repo/products_repo.dart';
import 'package:task_manager_test/features/home/logic/cubit/home_cubit.dart';
import 'package:task_manager_test/features/profile/data/repo/profile_repo.dart';
import 'package:task_manager_test/features/profile/logic/cubit/profile_cubit.dart';
import 'package:task_manager_test/features/login/data/repo/login_repo.dart';
import 'package:task_manager_test/features/login/logic/cubit/login_cubit.dart';
import 'package:task_manager_test/features/signup/data/repo/signup_repo.dart';
import 'package:task_manager_test/features/add_product/data/repo/add_product_repo.dart';
import 'package:task_manager_test/features/add_product/logic/cubit/add_product_cubit.dart';
import 'package:task_manager_test/features/product_details/data/repo/product_details_repo.dart';
import 'package:task_manager_test/features/product_details/logic/cubit/product_details_cubit.dart';
import 'package:task_manager_test/features/signup/logic/cubit/signup_cubit.dart';
import 'package:task_manager_test/core/theming/theme_cubit.dart';
import 'package:task_manager_test/core/theming/theme_repository.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = await DioFactory.getDio();
  getIt.registerFactory<ApiService>(() => ApiService(dio));

  //login
  getIt.registerFactory<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //signup
  getIt.registerFactory<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  //home
  getIt.registerFactory<ProductsRepo>(() => ProductsRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  //profile
  getIt.registerFactory<ProfileRepo>(() => ProfileRepo(getIt()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));

  //product details
  getIt.registerFactory<ProductDetailsRepo>(() => ProductDetailsRepo(getIt()));
  getIt.registerFactory<ProductDetailsCubit>(
    () => ProductDetailsCubit(getIt()),
  );

  //add product
  getIt.registerFactory<AddProductRepo>(() => AddProductRepo(getIt()));
  getIt.registerFactory<AddProductCubit>(() => AddProductCubit(getIt()));

  //theme
  getIt.registerLazySingleton<ThemeRepository>(() => ThemeRepository());
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit(getIt()));
}
