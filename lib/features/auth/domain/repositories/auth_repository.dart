import 'package:dartz/dartz.dart';
import 'package:homeegram/features/auth/data/models/generate_otp_prams.dart';

abstract class AuthRepository {
  Future<Either> generateOtp(GenerateOtpParams params);
  Future<Either> verifyOtp(String otp);
  Future<Either> siginUpWithProfileNameAndId(
      String profileName, String profileId);
  Future<Either> chooseProfileCategory(String profileCategory);
  Future<Either> chooseProfessionalCategory(String profileCategory);
  Future<Either> saveInterests(List<String> interests);
  Future<Either> saveProfileInfo(
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
