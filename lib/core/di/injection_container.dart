import 'package:get_it/get_it.dart';
import 'package:tasky/core/service/Api/api_service.dart';
import 'package:tasky/core/service/Api/dio_factory.dart';
import 'package:tasky/features/auth/data/datasource/auth_data_source.dart';
import 'package:tasky/features/auth/data/repo/auth_repos.dart';
import 'package:tasky/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initCore();
  await _initAuth();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  sl.registerLazySingleton<ApiService>(() => ApiService(dio));
}
Future<void> _initAuth() async {
  sl
    ..registerFactory(() => AuthBloc(sl()))
    ..registerLazySingleton(() => AuthRepos(sl()))
    ..registerLazySingleton(() => AuthDataSource(sl()));
}
