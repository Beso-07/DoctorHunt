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

// login with google
class LoginWithGoogleEvent extends AuthEvent {}

// foget password
class ForgetPasswordEvent extends AuthEvent {
  final String email;
 ForgetPasswordEvent({required this.email});
}

// verify password otp
class VerifyPasswordOtpEvent extends AuthEvent {
  final String email;
  final String token;
  VerifyPasswordOtpEvent({required this.email, required this.token});
}

// reset password
class ResetPasswordEvent extends AuthEvent {
  final String newPassword;
  ResetPasswordEvent({required this.newPassword});
}

// logout
class LogoutEvent extends AuthEvent {}
