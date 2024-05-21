import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasky/core/service/shared_pref/pref_keys.dart';
import 'package:tasky/core/service/shared_pref/shared_pref.dart';
import 'package:tasky/features/auth/data/models/login_request_body.dart';
import 'package:tasky/features/auth/data/models/login_responce.dart';
import 'package:tasky/features/auth/data/repo/auth_repos.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._repo) : super(const _Initial()) {
    on<LoginEvent>(_login);
  }
  final AuthRepos _repo;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  FutureOr<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await _repo.login(
      LoginRequestBody(
        username: nameController.text.trim(),
        password: passwordController.text,
      ),
    );
    await result.when(
      success: (loginData) async {
        final token = loginData.token ?? '';
        await SharedPref().setString(PrefKeys.accessToken, token);
        await SharedPref().setInt(PrefKeys.userId, loginData.id ?? 0);
        emit(AuthState.success(loginResponse: loginData));
      },
      failure: (error) {
        emit(AuthState.error(error: error));
      },
    );
  }
}
