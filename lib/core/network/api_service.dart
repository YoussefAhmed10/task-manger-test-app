import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:task_manager_test/core/network/api_constante.dart';
import 'package:task_manager_test/features/add_product/data/models/add_product_request_body.dart';
import 'package:task_manager_test/features/login/data/models/login_request_body.dart';
import 'package:task_manager_test/features/login/data/models/login_response_body.dart';
import 'package:task_manager_test/features/home/data/models/products_response_body.dart';
import 'package:task_manager_test/features/product_details/data/models/product_detail_model.dart';
import 'package:task_manager_test/features/profile/data/models/user_profile_model.dart';
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

  @GET(ApiConstant.products)
  Future<ProductsResponseBody> getProducts();

  @GET(ApiConstant.productsSearch)
  Future<ProductsResponseBody> searchProducts(@Query('q') String query);

  @GET('${ApiConstant.products}/{id}')
  Future<ProductDetailModel> getProductById(@Path('id') int id);

  @POST(ApiConstant.productsAdd)
  Future<ProductDetailModel> addProduct(
    @Body() AddProductRequestBody requestBody,
  );

  @GET(ApiConstant.currentUser)
  Future<UserProfileModel> getCurrentUser();
}
