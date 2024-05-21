import 'package:tasky/core/service/Api/api_service.dart';
import 'package:tasky/features/auth/data/models/login_request_body.dart';
import 'package:tasky/features/auth/data/models/login_responce.dart';

class AuthDataSource {
  AuthDataSource(this._api);

  final ApiService _api;

  Future<LoginResponse> login(LoginRequestBody body) async {
    final response =
        await _api.login(body);
    return response;
  }

}
