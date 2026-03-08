import 'package:ecommerce_app/core/network_handler/api_result.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_up_request_data.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/authentication_repositories.dart';

class SignUpUseCase {
  final AuthenticationRepository _authenticationRepository;

  SignUpUseCase(this._authenticationRepository);

  Future<ApiResult<bool>> execute({required SignUpRequestData data}) async {
    return await _authenticationRepository.signUpWithCredentials(data: data);
  }
}
