import 'package:dartz/dartz.dart';
import 'package:homeegram/core/errors/failures.dart';
import 'package:homeegram/features/auth/data/models/generate_otp_prams.dart';
import 'package:homeegram/features/auth/domain/repositories/auth_repository.dart';

class SendOtp {
  final AuthRepository repository;

  SendOtp({required this.repository});

  Future<Either<Failure, void>> call(String mobileNumber) async {
    return await repository
        .sendOtp(GenerateOtpParams(phoneNumber: mobileNumber));
  }
}
