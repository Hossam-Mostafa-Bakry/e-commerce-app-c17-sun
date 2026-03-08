import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_in_request_data.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_up_request_data.dart';

abstract class AuthenticationInterfaceDataSource {
  Future<Response> signInWithCredentials({required SignInRequestData data});

  Future<Response> signUpWithCredentials({required SignUpRequestData data});

  Future<Response> forgetPassword({required String email});
}

