import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/common/screens/under_build_screen.dart';
import 'package:tasky/core/di/injection_container.dart';
import 'package:tasky/core/routes/base_routes.dart';
import 'package:tasky/core/routes/routers.dart';
import 'package:tasky/core/service/shared_pref/pref_keys.dart';
import 'package:tasky/core/service/shared_pref/shared_pref.dart';
import 'package:tasky/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tasky/features/auth/presentation/screens/login.dart';
import 'package:tasky/features/home/presentation/bloc/get_all_tasks/get_all_tasks_bloc.dart';
import 'package:tasky/features/home/presentation/bloc/get_tasks_with_pagination/get_tasks_with_pagination_bloc.dart';
import 'package:tasky/features/home/presentation/screens/home_screen.dart';
import 'package:tasky/features/onboarding/presentation/onboarding_screen.dart';

class AppRouter {
  static Route<void> generateroutes(RouteSettings settings) {

    switch (settings.name) {
      case Routes.onboarding:
        return BaseRoute(page: const OnBoardingScreen());
      case Routes.login:
        return BaseRoute(
            page: BlocProvider(
          create: (context) => sl<AuthBloc>(),
          child: const LoginScreen(),
        ));
      case Routes.home:
        return BaseRoute(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) {
                  int id = SharedPref().getInt(PrefKeys.userId) as int;
                  return sl<GetAllTasksBloc>()..add(GetTasks(id: id));
                },
              ),
              BlocProvider(
                create: (context) {
                  return sl<GetTasksWithPaginationBloc>()
                    ..add(const GetNewTasksWithPagination(limit: 10, skip: 10));
                },
              ),
             
            ],
            child: const HomeScreen(),
          ),
        );

      default:
        return BaseRoute(page: const UnderBuildScreen());
    }
  }
}
