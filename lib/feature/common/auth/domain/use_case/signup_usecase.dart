import 'package:dartz/dartz.dart';
import 'package:doctorhunt/core/errors/failures.dart';
import 'package:doctorhunt/feature/common/auth/domain/entities/user_entity.dart';
import 'package:doctorhunt/feature/common/auth/domain/repositories/auth_repository.dart';

class SignupUsecase {
  final AuthRepository repository;
  SignupUsecase(this.repository);

  Future<Either<Failure, UserEntity>> call({
    required String name,
    required String email,
    required String password,
  }) {
    return repository.signup(name: name, email: email, password: password);
  }
}
