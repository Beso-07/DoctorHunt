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

  Future<void> logout();
}