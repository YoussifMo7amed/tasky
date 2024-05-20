import 'package:flutter/material.dart';
import 'package:tasky/core/common/screens/under_build_screen.dart';
import 'package:tasky/core/routes/base_routes.dart';
import 'package:tasky/core/routes/routers.dart';
import 'package:tasky/features/auth/presentation/screens/login.dart';
import 'package:tasky/features/onboarding/presentation/onboarding_screen.dart';

class AppRouter {
  static Route<void> generateroutes(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.onboarding:
        return BaseRoute(page: const OnBoardingScreen());
      case Routes.login:
        return BaseRoute(page: const LoginScreen());
      default:
        return BaseRoute(page: const UnderBuildScreen());
    }
  }
}
