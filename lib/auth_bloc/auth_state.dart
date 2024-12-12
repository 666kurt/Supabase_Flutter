abstract class BaseAuthState {
  const BaseAuthState();
}

class AuthInitialState extends BaseAuthState {}

class AuthSignedInState extends BaseAuthState {
  final String email;

  const AuthSignedInState({required this.email});
}

class AuthErrorState extends BaseAuthState {
  final String errorMessage;

  const AuthErrorState({required this.errorMessage});
}
