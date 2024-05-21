// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/app/connectivity_controller.dart';
import 'package:tasky/core/common/screens/no_network_screen.dart';
import 'package:tasky/core/routes/app_router.dart';
import 'package:tasky/core/routes/routers.dart';

class Tasky extends StatelessWidget {
  const Tasky({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: ConnectivityController.instance.isConnected,
        builder: (_, value, __) {
          if (value) {
            return ScreenUtilInit(
              designSize: const Size(360, 690),
              child: MaterialApp(
                title: 'Tasky',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  useMaterial3: true,
                ),
                onGenerateRoute: AppRouter.generateroutes,
                initialRoute: Routes.onboarding,
                // ignore: non_constant_identifier_names
                builder: (context, Widget) {
                  return GestureDetector(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Scaffold(
                      body: Builder(
                        builder: (context) {
                          ConnectivityController.instance.init();
                          return Widget!;
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return MaterialApp(
              title: 'Narouto Shop',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
                useMaterial3: true,
              ),
              home: const NoNetworkScreen(),
            );
          }
        });
  }
}
