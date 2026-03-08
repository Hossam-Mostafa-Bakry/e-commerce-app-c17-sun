import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/di_core/app_di_core.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_up_request_data.dart';
import 'package:ecommerce_app/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:equatable/equatable.dart';

import 'package:ecommerce_app/core/network_handler/api_result.dart';
import 'package:ecommerce_app/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_in_request_data.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEventSignIn>(_onAuthenticationEventSignIn);
    on<AuthenticationEventSignUp>(_onAuthenticationEventSignUp);
  }

  FutureOr<void> _onAuthenticationEventSignIn(
    AuthenticationEventSignIn event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationSignInLoadingState());

    try {
      final result = await getIt<SignInUseCase>().execute(data: event._data);

      switch (result) {
        case SuccessRequest():
          emit(AuthenticationSignInSuccessState());
        case FailureRequest():
          emit(AuthenticationSignInErrorState(
            exception: result.exception.message ?? "",
          ));
      }
    } catch (e) {
      emit(AuthenticationSignInErrorState(
        exception: e.toString(),
      ));
    }
  }

  FutureOr<void> _onAuthenticationEventSignUp(
    AuthenticationEventSignUp event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationSignInLoadingState());

    try {
      final result = await getIt<SignUpUseCase>().execute(data: event._data);

      switch (result) {
        case SuccessRequest():
          emit(AuthenticationSignInSuccessState());
        case FailureRequest():
          emit(AuthenticationSignInErrorState(
            exception: result.exception.message ?? "",
          ));
      }
    } catch (e) {
      emit(AuthenticationSignInErrorState(
        exception: e.toString(),
      ));
    }
  }
}
