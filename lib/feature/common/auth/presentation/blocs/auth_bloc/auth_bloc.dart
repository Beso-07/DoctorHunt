import 'package:bloc/bloc.dart';
import 'package:doctorhunt/feature/common/auth/domain/entities/user_entity.dart';
import 'package:doctorhunt/feature/common/auth/domain/use_case/forget_password_usecase.dart';
import 'package:doctorhunt/feature/common/auth/domain/use_case/login_usecase.dart';
import 'package:doctorhunt/feature/common/auth/domain/use_case/login_with_google_usecase.dart';
import 'package:doctorhunt/feature/common/auth/domain/use_case/logout_usecase.dart';
import 'package:doctorhunt/feature/common/auth/domain/use_case/reset_password_usecase.dart';
import 'package:doctorhunt/feature/common/auth/domain/use_case/signup_usecase.dart';
import 'package:doctorhunt/feature/common/auth/domain/use_case/verify_password_otp_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final SignupUsecase signupUsecase;
  final LogoutUsecase logoutUsecase;
  final LoginWithGoogleUsecase signInWithGoogleUsecase;
  final ForgetrPasswordUsecase forgetrPasswordUsecase;
  final VerifyPasswordOtpUsecase verifyPasswordOtpUsecase;
  final ResetPasswordUsecase resetPasswordUsecase;

  AuthBloc(
     this.loginUsecase,
     this.signupUsecase,
     this.logoutUsecase,
     this.signInWithGoogleUsecase,
     this.forgetrPasswordUsecase,
     this.verifyPasswordOtpUsecase,
     this.resetPasswordUsecase,
  ) : super(AuthInitial()) {
    on<LogoutEvent>(_onLogout);
    on<LoginEvent>(_onLogin);
    on<LoginWithGoogleEvent>(_onGoogleLogin);
    on<ForgetPasswordEvent>(_onForgetPassword);
    on<VerifyPasswordOtpEvent>(_onVerifyPasswordOtp);
    on<ResetPasswordEvent>(_onResetPassword);
    on<SignupEvent>(_onSignup);
    
  }

  // Signup
  Future<void> _onSignup(
    SignupEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(SignupLoading());
    final result = await signupUsecase(
      name: event.name,
      email: event.email,
      password: event.password,
    );
    result.fold(
      (failure) => emit(SignupError(failure.toString())),
      (user) => emit(SignupSuccess(user)),
    );
  }

  // Login
  Future<void> _onLogin(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoginLoading());
    final result = await loginUsecase(
      email: event.email,
      password: event.password,
    );
    result.fold(
      (failure) => emit(LoginError(failure.toString())),
      (user) => emit(LoginSuccess(user)),
    );
  }

  // Google Login
  Future<void> _onGoogleLogin(
    LoginWithGoogleEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoginWithGoogleLoading());
    final result = await signInWithGoogleUsecase();
    result.fold(
      (failure) => emit(LoginWithGoogleError(failure.toString())),
      (user) => emit(LoginWithGoogleSuccess()),
    );
  }

  // forget password
  Future<void> _onForgetPassword(
    ForgetPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(ForgetPasswordLoading());
    final result = await forgetrPasswordUsecase(email: event.email);
    result.fold(
      (failure) => emit(ForgetPasswordError(failure.toString())),
      (_) => emit(ForgetPasswordSuccess()),
    );
  }

  // Verify Reset OTP
  Future<void> _onVerifyPasswordOtp(
    VerifyPasswordOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(VerifyPasswordOtpLoading());
    final result = await verifyPasswordOtpUsecase(
      email: event.email,
      otp: event.token,
    );
    result.fold(
      (failure) => emit(VerifyPasswordOtpError(failure.toString())),
      (_) => emit(VerifyPasswordOtpSuccess()),
    );
  }

  // Reset Password
  Future<void> _onResetPassword(
    ResetPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(ResetPasswordLoading());
    final result = await resetPasswordUsecase(newPassword: event.newPassword);
    result.fold(
      (failure) => emit(ResetPasswordError(failure.toString())),
      (_) => emit(ResetPasswordSuccess()),
    );
  }

  // Logout
  Future<void> _onLogout(
    LogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LogoutLoading());
    final result = await logoutUsecase();
    result.fold(
      (failure) => emit(LogoutError(failure.toString())),
      (_) => emit(LogoutSuccess()),
    );
  }
}
  
