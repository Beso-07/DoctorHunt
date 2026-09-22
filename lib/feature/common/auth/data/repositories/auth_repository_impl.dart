import 'package:dartz/dartz.dart';
import 'package:doctorhunt/core/errors/auth_exception.dart';
import 'package:doctorhunt/core/errors/failures.dart';
import 'package:doctorhunt/feature/common/auth/data/data_source/auth_remote_data_source.dart';
import 'package:doctorhunt/feature/common/auth/domain/entities/user_entity.dart';
import 'package:doctorhunt/feature/common/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);

  // signup
  @override
  Future<Either<Failure, UserEntity>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final result = await remoteDataSource.signup(
        name: name,
        email: email,
        password: password,
      );
      return Right(result);
    } on AuthException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  // login
  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await remoteDataSource.login(
        email: email,
        password: password,
      );
      return Right(result);
    } on AuthException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  // login with google
  @override
  Future<Either<Failure, Unit>> loginWithGoogle() async {
    try {
      await remoteDataSource.loginWithGoogle();
      return const Right(unit);
    } on AuthException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  // forget password
  @override
  Future<Either<Failure, Unit>> forgetpassword({required String email}) async {
    try {
      await remoteDataSource.forgetPassword(email: email);
      return const Right(unit);
    } on AuthException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  // send otp code
  @override
  Future<Either<Failure, Unit>> verifyPasswordOtp({
    required String email,
    required String otp,
  }) async {
    try {
      await remoteDataSource.verifyPasswordOtp(email: email, otp: otp);
      return const Right(unit);
    } on AuthException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  // reset password
  @override
  Future<Either<Failure, Unit>> resetPassword({
    required String newPassword,
  }) async {
    try {
      await remoteDataSource.resetPassword(newPassword: newPassword);
      return const Right(unit);
    } on AuthException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  // logout
  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await remoteDataSource.logout();
      return const Right(unit);
    } on AuthException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
