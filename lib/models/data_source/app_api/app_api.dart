import 'dart:io';

import 'package:boost_test/app/constant.dart';
import 'package:boost_test/models/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

    @POST('/auth/login')
  Future<HttpResponse<LoginModel>> login({
    @Part(name: 'username') required String username,
    @Part(name: 'password') required String password,

  });

    @GET('/products')
  Future<HttpResponse<ProductsModel>> products({
    @Query('limit') int? limit,
  });


}
