import 'package:dartz/dartz.dart';
import 'package:homeegram/core/errors/failures.dart';
import 'package:homeegram/core/network/network_info.dart';
import 'package:homeegram/features/auth/data/datasources/auth_api_service.dart';
import 'package:homeegram/features/auth/data/models/generate_otp_prams.dart';
import 'package:homeegram/features/auth/domain/repositories/auth_repository.dart';
import 'package:homeegram/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApiService apiService;
  final NetworkInfo networkInfo;
  AuthRepositoryImpl({required this.apiService, required this.networkInfo});
  @override
  Future<Either<Failure, void>> sendOtp(GenerateOtpParams params) async {
    if (await networkInfo.isConnected) {
      try {
        await apiService.generateOtp(params);
        return Right(null);
      } catch (e) {
        return Left(Failure.server());
      }
    } else {
      return Left(Failure.network());
    }
  }

  @override
  Future<Either<Failure, void>> chooseProfessionalCategory(
      String profileCategory) {
    // TODO: implement chooseProfessionalCategory
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> chooseProfileCategory(String profileCategory) {
    // TODO: implement chooseProfileCategory
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> saveInterests(List<String> interests) {
    // TODO: implement saveInterests
    throw UnimplementedError();
  }

  @override
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
      String officeAddress) {
    // TODO: implement saveProfileInfo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> siginUpWithProfileNameAndId(
      String profileName, String profileId) {
    // TODO: implement siginUpWithProfileNameAndId
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> verifyOtp(String otp) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }
}
