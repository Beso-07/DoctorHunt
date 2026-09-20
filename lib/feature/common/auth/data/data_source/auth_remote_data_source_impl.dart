import 'package:doctorhunt/core/enums/user_role.dart';
import 'package:doctorhunt/feature/common/auth/data/data_source/auth_remote_data_source.dart';
import 'package:doctorhunt/feature/common/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final supabase = Supabase.instance.client;

  @override
  Future<UserModel> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await supabase.auth.signUp(
      email: email,
      password: password,
      data: {"name": name, "role": UserRole.patient.name},
    );

    final user = response.user;
    if (user == null) {
      throw const AuthException('Failed to create account. Please try again.');
    }
    return UserModel(
      id: user.id,
      name: name,
      email: email,
      role: UserRole.patient,
    );
  }

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    final user = response.user;
    
    if (user == null) {
      throw const AuthException("Invalid email or password.");
    }

    final metadata = user.userMetadata ?? {};
    final String name = metadata['name'] ?? '';
    final String roleString = metadata['role'] ?? UserRole.patient.name;

    return UserModel(
      id: user.id,
      name: name,
      email: user.email ?? email,
      role: UserRole.values.byName(roleString),
    );
  }

  @override
  Future<void> logout() async {
    await supabase.auth.signOut();
  }
}
