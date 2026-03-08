part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

final class AuthenticationEventSignIn extends AuthenticationEvent {
  final SignInRequestData _data;

  const AuthenticationEventSignIn(this._data);
}

final class AuthenticationEventSignUp extends AuthenticationEvent {
  final SignUpRequestData _data;

  const AuthenticationEventSignUp(this._data);
}
