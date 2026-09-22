import 'package:doctorhunt/core/api/api_consumer.dart';
import 'package:doctorhunt/core/api/dio_consumer.dart';
import 'package:doctorhunt/core/network/network_info.dart';
import 'package:doctorhunt/feature/common/auth/data/data_source/auth_remote_data_source.dart';
import 'package:doctorhunt/feature/common/auth/data/data_source/auth_remote_data_source_impl.dart';
import 'package:doctorhunt/feature/common/auth/data/repositories/auth_repository_impl.dart';
import 'package:doctorhunt/feature/common/auth/domain/repositories/auth_repository.dart';
import 'package:doctorhunt/feature/common/auth/domain/use_case/forget_password_usecase.dart';
import 'package:doctorhunt/feature/common/auth/domain/use_case/login_usecase.dart';
import 'package:doctorhunt/feature/common/auth/domain/use_case/login_with_google_usecase.dart';
import 'package:doctorhunt/feature/common/auth/domain/use_case/logout_usecase.dart';
import 'package:doctorhunt/feature/common/auth/domain/use_case/reset_password_usecase.dart';
import 'package:doctorhunt/feature/common/auth/domain/use_case/signup_usecase.dart';
import 'package:doctorhunt/feature/common/auth/domain/use_case/verify_password_otp_usecase.dart';
import 'package:doctorhunt/feature/common/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final locator = GetIt.instance;

void initServiceLocator() {
  //===============================  External     ========================================== //
  locator.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  //===============================  Core Network ========================================== //
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));
  locator.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: locator()));

  //===============================  Data Sources ========================================== //
   locator.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
  
  //===============================  Repository   ========================================== //
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(locator()));

  // ==============================  UseCases     ========================================== //
  locator.registerLazySingleton<SignupUsecase>(() => SignupUsecase(locator()),);
  locator.registerLazySingleton<LoginUsecase>(() => LoginUsecase(locator()),);
  locator.registerLazySingleton<LoginWithGoogleUsecase>(() => LoginWithGoogleUsecase(locator()),);
  locator.registerLazySingleton<ForgetrPasswordUsecase>(() => ForgetrPasswordUsecase(locator()),);
  locator.registerLazySingleton<VerifyPasswordOtpUsecase>(() => VerifyPasswordOtpUsecase(locator()),);
  locator.registerLazySingleton<ResetPasswordUsecase>(() => ResetPasswordUsecase(locator()),);
  locator.registerLazySingleton<LogoutUsecase>(() => LogoutUsecase(locator()),);

  //===============================  Blocs        ========================================== //
  locator.registerFactory<AuthBloc>(() => AuthBloc(locator(),locator(),locator(),locator(),locator(),locator(),locator(),));
}
