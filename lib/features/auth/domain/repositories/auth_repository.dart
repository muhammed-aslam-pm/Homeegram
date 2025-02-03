import 'package:dartz/dartz.dart';
import 'package:homeegram/core/errors/failures.dart';
import 'package:homeegram/features/auth/data/models/generate_otp_prams.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> sendOtp(GenerateOtpParams params);
  Future<Either<Failure, void>> verifyOtp(String otp, String phoneNumber);
  Future<Either<Failure, void>> siginUpWithProfileNameAndId(
      String profileName, String profileId);
  Future<Either<Failure, void>> chooseProfileCategory(String profileCategory);
  Future<Either<Failure, void>> chooseProfessionalCategory(
      String profileCategory);
  Future<Either<Failure, void>> saveInterests(List<String> interests);
  Future<Either<Failure, void>> saveProfileInfo(
    String profileGagline,
    String bio,
    String comapnyName,
    String websiteAddress,
    String experience,
    String experienceType,
    String registrationNumber,
    List<String> achievements,
    String officeTiming,
    String officeAddress,
  );
}
