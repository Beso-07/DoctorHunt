import 'package:dartz/dartz.dart';
import 'package:doctorhunt/core/errors/failures.dart';
import 'package:doctorhunt/feature/common/auth/domain/entities/user_entity.dart';
import 'package:doctorhunt/feature/common/auth/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository repository;
  LoginUsecase(this.repository);

  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
  }) {
    return repository.login(email: email, password: password);
  }
}
