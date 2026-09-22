import 'package:dartz/dartz.dart';
import 'package:doctorhunt/core/errors/failures.dart';
import 'package:doctorhunt/feature/common/auth/domain/repositories/auth_repository.dart';

class ForgetrPasswordUsecase {
  final AuthRepository repository;
  ForgetrPasswordUsecase(this.repository);

  Future<Either<Failure, Unit>> call({required String email}) {
    return repository.forgetpassword(email: email);
  }
}
