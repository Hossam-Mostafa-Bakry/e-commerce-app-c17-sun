import 'package:ecommerce_app/core/handler/auth_handler/auth_handler_shared_pref.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    GetIt.I<AuthHandlerSharedPref>().isAuthenticated().then(
      (value) {
        if (value) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.mainRoute,
            (route) => false,
          );
        } else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.signInRoute,
            (route) => false,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/splash_background.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
