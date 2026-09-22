part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}


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

// login with google
final class LoginWithGoogleLoading extends AuthState {}
final class LoginWithGoogleSuccess extends AuthState {}
final class LoginWithGoogleError extends AuthState {
  final String message;
  LoginWithGoogleError(this.message);
}

// forget password
final class ForgetPasswordLoading extends AuthState {}
final class ForgetPasswordSuccess extends AuthState {}
final class ForgetPasswordError extends AuthState {
  final String message;
  ForgetPasswordError(this.message);
}

// verify reset otp
final class VerifyPasswordOtpLoading extends AuthState {}
final class VerifyPasswordOtpSuccess extends AuthState {}
final class VerifyPasswordOtpError extends AuthState {
  final String message;
  VerifyPasswordOtpError(this.message);
}

// reset password
final class ResetPasswordLoading extends AuthState {}
final class ResetPasswordSuccess extends AuthState {}
final class ResetPasswordError extends AuthState {
  final String message;
  ResetPasswordError(this.message);
}

// logout
final class LogoutLoading extends AuthState {}
final class LogoutSuccess extends AuthState {}
final class LogoutError extends AuthState {
  final String message;
  LogoutError(this.message);
}
