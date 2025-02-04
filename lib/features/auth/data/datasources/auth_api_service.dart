import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homeegram/core/errors/failures.dart';
import 'package:homeegram/core/network/api_client.dart.dart';
import 'package:homeegram/features/auth/data/models/generate_otp_prams.dart';
import 'package:homeegram/service_locator.dart';
import 'package:homeegram/core/constants/api_constants.dart';

abstract class AuthApiService {
  Future<Either<Failure, Response>> generateOtp(GenerateOtpParams params);
  Future<Either<Failure, Response>> verifyOtp(String otp, String PhoneNumber);
}

class AuthApiServiceImpl extends AuthApiService {
  final ApiClient apiClient;

  AuthApiServiceImpl({required this.apiClient});
  @override
  Future<Either<Failure, Response>> generateOtp(
      GenerateOtpParams params) async {
    try {
      final response = await apiClient.post(
        ApiUrls.generateOtp,
        data: params.toMap(),
      );
      return Right(response);
    } catch (e) {
      return Left(Failure.unexpected());
    }
  }

  @override
  Future<Either<Failure, Response>> verifyOtp(
      String otp, String phoneNumber) async {
    try {
      final response = await apiClient.post(
        ApiUrls.verifyOtp,
        data: {
          "mobile_number": phoneNumber,
          'otp': otp,
        },
      );
      return Right(response);
    } catch (e) {
      return Left(Failure.unexpected());
    }
  }
}
