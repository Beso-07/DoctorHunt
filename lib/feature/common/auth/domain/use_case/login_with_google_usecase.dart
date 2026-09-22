import 'package:dartz/dartz.dart';
import 'package:doctorhunt/core/errors/failures.dart';
import 'package:doctorhunt/feature/common/auth/domain/repositories/auth_repository.dart';

class LoginWithGoogleUsecase {
  final AuthRepository repository;
  LoginWithGoogleUsecase(this.repository);

  Future<Either<Failure, Unit>> call() {
    return repository.loginWithGoogle();
  }
}