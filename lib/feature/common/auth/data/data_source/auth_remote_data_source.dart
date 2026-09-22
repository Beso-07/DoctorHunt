import 'package:doctorhunt/feature/common/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signup({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> login({
    required String email,
    required String password,
  });

  Future<void> loginWithGoogle();

  Future<void> forgetPassword({required String email});
  Future<void> verifyPasswordOtp({
    required String email,
    required String otp,
  });
  
  Future<void> resetPassword({required String newPassword});

  Future<void> logout();
}