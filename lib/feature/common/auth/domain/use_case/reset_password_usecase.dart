import 'package:dartz/dartz.dart';
import 'package:doctorhunt/core/errors/failures.dart';
import 'package:doctorhunt/feature/common/auth/domain/repositories/auth_repository.dart';

class ResetPasswordUsecase {
  final AuthRepository repository;
  ResetPasswordUsecase(this.repository);

  Future<Either<Failure, Unit>> call({required String newPassword}) {
    return repository.resetPassword(newPassword: newPassword);
  }
}
