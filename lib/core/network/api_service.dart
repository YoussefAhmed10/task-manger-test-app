import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:task_manager_test/core/network/api_constante.dart';
import 'package:task_manager_test/features/login/data/models/login_request_body.dart';
import 'package:task_manager_test/features/login/data/models/login_response_body.dart';
import 'package:task_manager_test/features/signup/data/models/signup_request_body.dart';
import 'package:task_manager_test/features/signup/data/models/signup_response_body.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @POST(ApiConstant.login)
  Future<LoginResponseBody> loginUser(@Body() LoginRequestBody requestBody);

  @POST(ApiConstant.register)
  Future<SignupResponseBody> registerUser(@Body() SignupRequestBody requestBody);
}
