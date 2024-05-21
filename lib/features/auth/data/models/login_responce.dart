import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_responce.g.dart';
@JsonSerializable()
class LoginResponse {
int? id;
String? username;
String ?password;
String ?email;
String? token;
LoginResponse({this.id,this.username,this.email,this.token});

factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

}