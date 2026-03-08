import 'package:ecommerce_app/features/auth/domain/repositories/authentication_repositories.dart';

class ForgetPasswordUseCase {
  final AuthenticationRepository _authenticationRepository;

  ForgetPasswordUseCase(this._authenticationRepository);

  Future<void> execute({required String email}) async {
    _authenticationRepository.forgetPassword(email: email);
  }
}
