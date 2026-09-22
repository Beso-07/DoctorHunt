import 'package:dartz/dartz.dart';
import 'package:doctorhunt/core/errors/failures.dart';
import 'package:doctorhunt/feature/common/auth/domain/repositories/auth_repository.dart';

class VerifyPasswordOtpUsecase {
  final AuthRepository repository;
  VerifyPasswordOtpUsecase(this.repository);

  Future<Either<Failure, Unit>> call({
    required String email,
    required String otp,
  }) {
    return repository.verifyPasswordOtp(email: email, otp: otp);
  }
}
