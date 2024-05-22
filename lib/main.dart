import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/app/bloc_observer.dart';
import 'package:tasky/core/di/injection_container.dart';
import 'package:tasky/core/service/shared_pref/shared_pref.dart';
import 'package:tasky/tasky.dart';

void main()async {
  
  WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = AppBlocObserver();
    await SharedPref().instantiatePreferences();
    await setupInjector();

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  ).then((_) {
    runApp(const Tasky());
  });
}
