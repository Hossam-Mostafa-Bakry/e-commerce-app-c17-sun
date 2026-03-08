import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:ecommerce_app/core/di_core/app_di_core.dart';
import 'package:ecommerce_app/core/handler/auth_handler/auth_handler_shared_pref.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/services/loading_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'core/routes_manager/route_generator.dart';
import 'core/services/bloc_observer.dart';

/// Repository Pattern
/// UI --> Bloc --> UseCase --> Repository --> DataSource

/// Dio
/// GetIt
/// Loading
/// Toast
/// API [Auth]

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// Setup Service Locator For All App Features
  AppDiCore.setup();
  Bloc.observer = MyBlocObserver();
  runApp(const MainApp());
  configLoading();
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.initial,
        builder: EasyLoading.init(builder: BotToastInit()),
      ),
    );
  }
}
