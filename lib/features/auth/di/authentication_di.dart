import 'package:ecommerce_app/core/di_core/app_di_core.dart';
import 'package:ecommerce_app/core/network_handler/dio_api_client.dart';
import 'package:ecommerce_app/features/auth/data/data_source/authentication_data_source.dart';
import 'package:ecommerce_app/features/auth/data/data_source/remote_authentication_data_source.dart';
import 'package:ecommerce_app/features/auth/data/repositories_imp/authentication_repository_imp.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/authentication_repositories.dart';
import 'package:ecommerce_app/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/authentication_bloc.dart';
import 'package:get_it/get_it.dart';

abstract class AuthenticationDi {
  static void setup() {
    GetIt.instance
      ..registerLazySingleton<AuthenticationInterfaceDataSource>(
        () => RemoteAuthenticationDataSource(GetIt.I()),
      )
      ..registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepositoryImp(GetIt.I()),
      )
      ..registerLazySingleton<SignInUseCase>(
        () => SignInUseCase(GetIt.I()),
      )
      ..registerLazySingleton<AuthenticationBloc>(
        () => AuthenticationBloc(),
      );
  }
}
