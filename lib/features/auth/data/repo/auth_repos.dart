import 'package:tasky/core/service/Api/api_result.dart';
import 'package:tasky/features/auth/data/datasource/auth_data_source.dart';
import 'package:tasky/features/auth/data/models/login_request_body.dart';
import 'package:tasky/features/auth/data/models/login_responce.dart';

class AuthRepos {
  AuthRepos(this._dataSource);

  final AuthDataSource _dataSource;

  Future<ApiResult<LoginResponse>> login(LoginRequestBody body) async {
    try {
      final response = await _dataSource.login(body);
      return ApiResult.success(response);
    } catch (error) {
      return  ApiResult.failure(error.toString());
    }
  }}