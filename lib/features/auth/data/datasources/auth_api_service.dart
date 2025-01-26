import 'package:dartz/dartz.dart';
import 'package:homeegram/core/errors/failures.dart';
import 'package:homeegram/core/network/api_client.dart.dart';
import 'package:homeegram/features/auth/data/models/generate_otp_prams.dart';
import 'package:homeegram/service_locator.dart';
import 'package:homeegram/core/constants/api_constants.dart';

abstract class AuthApiService {
  Future<Either<Failure, void>> generateOtp(GenerateOtpParams params);
  Future<Either> verifyOtp(String otp);
}

class AuthApiServiceImpl extends AuthApiService {
  final ApiClient apiClient;

  AuthApiServiceImpl({required this.apiClient});
  @override
  Future<Either<Failure, void>> generateOtp(GenerateOtpParams params) async {
    try {
      final response = await apiClient.post(
        ApiUrls.generateOtp,
        data: params.toMap(),
      );
      return Right(response.data);
    } catch (e) {
      return Left(Failure.unexpected());
    }
  }

  @override
  Future<Either> verifyOtp(String otp) async {
    try {
      final response = await apiClient.post(
        ApiUrls.verifyOtp,
        data: {
          'otp': otp,
        },
      );
      return Right(response.data);
    } catch (e) {
      return Left(e);
    }
  }
}
