import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/app/connectivity_controller.dart';
import 'package:tasky/core/common/screens/no_network_screen.dart';

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
                home: Scaffold(
                  appBar: AppBar(
                    title: const Text('Tasky'),
                  ),
                  body: const Center(
                    child: Text('Tasky'),
                  ),
                ),
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
