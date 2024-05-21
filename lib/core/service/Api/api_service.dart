import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';
import 'package:tasky/core/service/Api/endpoints.dart';
import 'package:tasky/features/auth/data/models/login_request_body.dart';
import 'package:tasky/features/auth/data/models/login_responce.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(EndPoints.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequest);
}
