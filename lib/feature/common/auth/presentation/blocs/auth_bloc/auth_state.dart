part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}


// login
final class LoginLoading extends AuthState {}
final class LoginSuccess extends AuthState {
  final UserEntity user; 
  LoginSuccess(this.user);
}
final class LoginError extends AuthState {
  final String message;
  LoginError(this.message);
}

// signup
final class SignupLoading extends AuthState {}
final class SignupSuccess extends AuthState {
  final UserEntity user;
  SignupSuccess(this.user);
}
final class SignupError extends AuthState {
  final String message;
  SignupError(this.message);
}

// logout
final class LogoutLoading extends AuthState {}
final class LogoutSuccess extends AuthState {}
final class LogoutError extends AuthState {
  final String message;
  LogoutError(this.message);
}
