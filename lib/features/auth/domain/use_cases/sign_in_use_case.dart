import 'package:ecommerce_app/core/network_handler/api_result.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_in_request_data.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/authentication_repositories.dart';

/// UseCase ||SOILED PRINCIPLE ||
/// 1- Single Responsibility Principle

class SignInUseCase {
  final AuthenticationRepository _authenticationRepository;

  SignInUseCase(this._authenticationRepository);

  Future<ApiResult<bool>> execute({
    required SignInRequestData data,
  }) async {
    /// Repository
    return await _authenticationRepository.signInWithCredentials(
      data: data,
    );
  }
}
