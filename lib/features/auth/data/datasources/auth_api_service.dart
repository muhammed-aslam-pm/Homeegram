import 'package:dartz/dartz.dart';
import 'package:homeegram/core/network/api_client.dart.dart';
import 'package:homeegram/features/auth/data/models/generate_otp_prams.dart';
import 'package:homeegram/service_locator.dart';
import 'package:homeegram/core/constants/api_constants.dart';

abstract class AuthApiService {
  Future<Either> generateOtp(GenerateOtpParams params);
  Future<Either> verifyOtp(String otp);
}

class AuthApiServiceImpl extends AuthApiService {
  final dioClient = sl<DioClient>();
  @override
  Future<Either> generateOtp(GenerateOtpParams params) async {
    try {
      final response = await dioClient.post(
        ApiUrls.generateOtp,
        data: params.toMap(),
      );
      return Right(response.data);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> verifyOtp(String otp) async {
    try {
      final response = await dioClient.post(
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
