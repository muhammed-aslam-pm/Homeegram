import 'package:dartz/dartz.dart';
import 'package:homeegram/features/auth/data/datasources/auth_api_service.dart';
import 'package:homeegram/features/auth/data/models/generate_otp_prams.dart';
import 'package:homeegram/features/auth/domain/repositories/auth_repository.dart';
import 'package:homeegram/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  final _authApiService = sl<AuthApiService>();

  @override
  Future<Either> generateOtp(GenerateOtpParams params) {
    return _authApiService.generateOtp(params);
  }

  @override
  Future<Either> chooseProfessionalCategory(String profileCategory) {
    // TODO: implement chooseProfessionalCategory
    throw UnimplementedError();
  }

  @override
  Future<Either> chooseProfileCategory(String profileCategory) {
    // TODO: implement chooseProfileCategory
    throw UnimplementedError();
  }

  @override
  Future<Either> saveInterests(List<String> interests) {
    // TODO: implement saveInterests
    throw UnimplementedError();
  }

  @override
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
      String officeAddress) {
    // TODO: implement saveProfileInfo
    throw UnimplementedError();
  }

  @override
  Future<Either> siginUpWithProfileNameAndId(
      String profileName, String profileId) {
    // TODO: implement siginUpWithProfileNameAndId
    throw UnimplementedError();
  }

  @override
  Future<Either> verifyOtp(String otp) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }
}
