import 'package:dartz/dartz.dart';
import 'package:homeegram/core/errors/failures.dart';
import 'package:homeegram/features/auth/domain/repositories/auth_repository.dart';

class VerifyOtp {
  final AuthRepository repository;

  VerifyOtp({required this.repository});

  Future<Either<Failure, void>> call(String otp, String phoneNumber) async {
    return await repository.verifyOtp(otp, phoneNumber);
  }
}
