import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter_auth/auth_bloc/auth_event.dart';
import 'package:supabase_flutter_auth/auth_bloc/auth_state.dart';
import 'package:supabase_flutter_auth/auth_service.dart';

class AuthBloc extends Bloc<BaseAuthEvent, BaseAuthState> {
  final AuthService _authService = AuthService();

  AuthBloc() : super(AuthInitialState()) {
    on<SignInEvent>((event, emit) async {
      if (event.email.isNotEmpty && event.password.isNotEmpty) {
        try {
          await _authService.signIn(event.email, event.password);
          emit(AuthSignedInState(email: event.email));
        } catch (error) {
          emit(AuthErrorState(errorMessage: error.toString()));
        }
      } else {
        emit(
            const AuthErrorState(errorMessage: "TextField must be not empty!"));
      }
    });
    on<SignUpEvent>((event, emit) async {
      if ((event.email.isNotEmpty && event.password.isNotEmpty) &&
          (event.password == event.confirmPassword)) {
        try {
          await _authService.signUp(event.email, event.password);
          emit(AuthSignedInState(email: event.email));
        } catch (error) {
          emit(AuthErrorState(errorMessage: error.toString()));
        }
      } else {
        emit(const AuthErrorState(
            errorMessage:
                "Password don't match OR TextField must be not empty!"));
      }
    });
    on<SignOutEvent>((event, emit) async {
      await _authService.signOut();
      emit(AuthInitialState());
    });
  }
}
