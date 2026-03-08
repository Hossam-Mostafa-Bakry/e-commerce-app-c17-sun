import 'package:ecommerce_app/core/handler/auth_handler/auth_handler_shared_pref.dart';
import 'package:ecommerce_app/core/handler/auth_handler/auth_interface_handler.dart';
import 'package:ecommerce_app/core/network_handler/api_interface.dart';
import 'package:ecommerce_app/core/network_handler/dio_api_client.dart';
import 'package:ecommerce_app/features/auth/di/authentication_di.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

abstract class AppDiCore {
  static setup() {
    GetIt.instance.registerLazySingleton(
      () => AuthHandlerSharedPref(),
    );

    GetIt.instance.registerLazySingleton<ApiInterface>(
      () => DioApiClient(),
    );

    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        AuthenticationDi.setup();
      },
    );
  }
}
