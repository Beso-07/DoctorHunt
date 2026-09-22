import 'package:dartz/dartz.dart';
import 'package:doctorhunt/core/errors/failures.dart';
import 'package:doctorhunt/feature/common/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signup({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> loginWithGoogle();

  Future<Either<Failure, Unit>> forgetpassword({required String email});
  
  Future<Either<Failure, Unit>> verifyPasswordOtp({
    required String email,
    required String otp,
  });
  
  Future<Either<Failure, Unit>> resetPassword({required String newPassword});

  Future<Either<Failure, Unit>> logout();
}
