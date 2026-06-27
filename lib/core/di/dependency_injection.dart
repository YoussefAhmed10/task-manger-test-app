import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task_manager_test/core/network/api_service.dart';
import 'package:task_manager_test/core/network/dio_factory.dart';
import 'package:task_manager_test/features/login/data/repo/login_repo.dart';
import 'package:task_manager_test/features/login/logic/cubit/login_cubit.dart';
import 'package:task_manager_test/features/signup/data/repo/signup_repo.dart';
import 'package:task_manager_test/features/signup/logic/cubit/signup_cubit.dart';

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
}
