abstract class BaseAuthEvent {
  const BaseAuthEvent();
}

class SignInEvent extends BaseAuthEvent {
  final String email;
  final String password;

  const SignInEvent({
    required this.email,
    required this.password,
  });
}

class SignUpEvent extends BaseAuthEvent {
  final String email;
  final String password;
  final String confirmPassword;

  const SignUpEvent({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}

class SignOutEvent extends BaseAuthEvent {}
