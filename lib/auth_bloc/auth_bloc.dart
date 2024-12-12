import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter_auth/auth_bloc/auth_event.dart';
import 'package:supabase_flutter_auth/auth_bloc/auth_state.dart';
import 'package:supabase_flutter_auth/auth_service.dart';

class AuthBloc extends Bloc<BaseAuthEvent, BaseAuthState> {
  // Instance of auth service
  final AuthService _authService = AuthService();

  AuthBloc() : super(AuthInitialState()) {
    // Trigger of SignInEvent
    on<SignInEvent>((event, emit) async {
      debugPrint("AuthBloc");
      if (event.email.isNotEmpty && event.password.isNotEmpty) {
        try {
          await _authService.signIn(event.email, event.password);
          emit(AuthSignedInState(email: event.email));
        } catch (error) {
          emit(AuthErrorState(errorMessage: error.toString()));
        }
      } else {
        emit(const AuthErrorState(
            errorMessage: "TextField's must be not empty"));
      }
    });

    // Trigger of SignUpEvent
    on<SignUpEvent>((event, emit) async {
      if ((event.email.isNotEmpty && event.password.isNotEmpty) &&
          (event.confirmPassword == event.password)) {
        try {
          await _authService.signUp(event.email, event.password);
          emit(AuthSignedInState(email: event.email));
        } catch (error) {
          emit(AuthErrorState(errorMessage: error.toString()));
        }
      } else {
        emit(const AuthErrorState(
            errorMessage:
                "TextField's must be not empty OR password don't match"));
      }
    });

    // Trigger of SignOutEvent
    on<SignOutEvent>((event, emit) async {
      await _authService.signOut();
    });
  }
}
