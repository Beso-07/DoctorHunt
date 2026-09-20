import 'package:bloc/bloc.dart';
import 'package:doctorhunt/feature/common/auth/domain/entities/user_entity.dart';
import 'package:doctorhunt/feature/common/auth/domain/use_case/login_usecase.dart';
import 'package:doctorhunt/feature/common/auth/domain/use_case/logout_usecase.dart';
import 'package:doctorhunt/feature/common/auth/domain/use_case/signup_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final SignupUsecase signupUsecase;
  final LogoutUsecase logoutUsecase;
  AuthBloc(this.loginUsecase, this.signupUsecase, this.logoutUsecase)
    : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // Login
      on<LoginEvent>((event, emit) async {
        emit(LoginLoading());
        final result = await loginUsecase(
          email: event.email,
          password: event.password,
        );
        result.fold(
          (failure) => emit(LoginError(failure.toString())),
          (user) => emit(LoginSuccess(user)),
        );
      });

      // Signup 
      on<SignupEvent>((event, emit) async {
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
      });

      // logout 
      on<LogoutEvent>((event, emit) async {
        emit(SignupLoading());
        final result = await logoutUsecase();
        result.fold(
          (failure) => emit(LogoutError(failure.toString())),
          (_) => emit(LogoutSuccess()),
        );
      });
    });
  }
}
