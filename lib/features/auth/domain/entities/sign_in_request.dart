import 'package:equatable/equatable.dart';

class SignInRequest extends Equatable {
  final String email;
  final String password;

  const SignInRequest(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
