import 'package:ecommerce_app/core/network_handler/api_result.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_in_request_data.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_up_request_data.dart';

abstract class AuthenticationRepository {

  Future<ApiResult<bool>> signInWithCredentials({
    required SignInRequestData data,
  });

  Future<void> signUpWithCredentials({
    required SignUpRequestData data,
  });

  Future<void> forgetPassword({
    required String email,
  });
}