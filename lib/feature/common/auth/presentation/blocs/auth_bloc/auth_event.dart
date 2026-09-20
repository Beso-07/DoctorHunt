part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

// login
class LoginEvent extends AuthEvent{
  final String email;
  final String password;

  LoginEvent({
    required this.email,
    required this.password,
  });
}

// signup
class SignupEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  SignupEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}

// logout
class LogoutEvent extends AuthEvent {}
