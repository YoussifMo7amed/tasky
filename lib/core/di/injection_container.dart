import 'package:get_it/get_it.dart';
import 'package:tasky/core/service/Api/api_service.dart';
import 'package:tasky/core/service/Api/dio_factory.dart';
import 'package:tasky/features/auth/data/datasource/auth_data_source.dart';
import 'package:tasky/features/auth/data/repo/auth_repos.dart';
import 'package:tasky/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tasky/features/home/data/datasource/home_datasource.dart';
import 'package:tasky/features/home/data/repo/home_repos.dart';
import 'package:tasky/features/home/presentation/bloc/add_tasks/add_tasks_bloc.dart';
import 'package:tasky/features/home/presentation/bloc/delete_task/delete_task_bloc.dart';
import 'package:tasky/features/home/presentation/bloc/get_all_tasks/get_all_tasks_bloc.dart';
import 'package:tasky/features/home/presentation/bloc/get_tasks_with_pagination/get_tasks_with_pagination_bloc.dart';
import 'package:tasky/features/home/presentation/bloc/update_task/update_task_bloc.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initCore();
  await _initAuth();
  await _inithome();

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
Future<void> _inithome() async {
  sl
    ..registerLazySingleton(() => HomeRepos(sl()))
    ..registerLazySingleton(() => HomeDataSource(sl()))
    ..registerFactory(() => GetAllTasksBloc(sl()))
    ..registerFactory(() => AddTasksBloc(sl()))
    ..registerFactory(() => UpdateTaskBloc(sl()))
    ..registerFactory(() =>DeleteTaskBloc(sl()))
    ..registerFactory(() => GetTasksWithPaginationBloc(sl()));

}
