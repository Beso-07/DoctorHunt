import 'dart:core';
import 'package:doctorhunt/core/enums/user_role.dart';
import 'package:doctorhunt/feature/common/auth/data/data_source/auth_remote_data_source.dart';
import 'package:doctorhunt/feature/common/auth/data/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final supabase = Supabase.instance.client;

  // signup
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

  // login
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

  // login with google
  @override
  Future<AuthResponse> loginWithGoogle() async {
    const webClientId =
        '41810389675-5qkonr7fnnde81c7ktidi9qf9bphs1fd.apps.googleusercontent.com';
    const androidClientId =
        'Y41810389675-ei6p7mg2p2v9tpa3e7m651b3hh6ol5ot.apps.googleusercontent.com';

    final GoogleSignIn googleSignIn = GoogleSignIn.instance;
    await googleSignIn.initialize(
      clientId: androidClientId,
      serverClientId: webClientId,
    );

    final GoogleSignInAccount googleUser = await googleSignIn.authenticate();
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;
    final idToken = googleAuth.idToken;

    if (idToken == null) {
      throw 'No ID Token found.';
    }
    const scopes = <String>['email', 'profile', 'openid'];
    final authorization =
        await googleUser.authorizationClient.authorizationForScopes(scopes) ??
        await googleUser.authorizationClient.authorizeScopes(scopes);

    final accessToken = authorization.accessToken;

    final response = await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
    final user = response.user;
    if (user != null) {
      final existingRole = user.userMetadata?['role'];

      // Update metadata if role isn't set yet
      if (existingRole == null) {
        await supabase.auth.updateUser(
          UserAttributes(data: {'role': UserRole.patient.name}),
        );
      }
    }

    return response;
  }

  // forget password
  @override
  Future<void> forgetPassword({required String email}) async {
    try {
      await supabase.auth.resetPasswordForEmail(email);
    } on AuthException catch (e) {
      print('Reset password error: ${e.message}');
      print('Status code: ${e.statusCode}');
      rethrow;
    }
  }

  // verify password with otp
  @override
  Future<void> verifyPasswordOtp({
    required String email,
    required String otp,
  }) async {
    await supabase.auth.verifyOTP(
      email: email,
      token: otp,
      type: OtpType.recovery,
    );
  }

  // reset password
  @override
  Future<void> resetPassword({required String newPassword}) async {
    await supabase.auth.updateUser(UserAttributes(password: newPassword));
  }

  // logout
  @override
  Future<void> logout() async {
    await supabase.auth.signOut();
  }
}
