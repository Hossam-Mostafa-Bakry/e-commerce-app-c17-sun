import 'package:ecommerce_app/features/auth/domain/entities/sign_up_request_data.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/authentication_repositories.dart';

class SignUpUseCase {
  final AuthenticationRepository _authenticationRepository;

  SignUpUseCase(this._authenticationRepository);

  Future<void> execute(SignUpRequestData data) async {
    _authenticationRepository.signUpWithCredentials(data: data);
  }
}
