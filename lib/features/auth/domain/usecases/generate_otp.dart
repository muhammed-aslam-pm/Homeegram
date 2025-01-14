import 'package:dartz/dartz.dart';
import 'package:homeegram/core/usecase/usecase.dart';
import 'package:homeegram/features/auth/data/models/generate_otp_prams.dart';
import 'package:homeegram/features/auth/domain/repositories/auth_repository.dart';
import 'package:homeegram/service_locator.dart';

class GenerateOtpUseCase implements UseCase<Either, GenerateOtpParams> {
  @override
  Future<Either> call({GenerateOtpParams? param}) async {
    return sl<AuthRepository>().generateOtp(param!);
  }
}
