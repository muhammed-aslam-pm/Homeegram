import 'package:get_it/get_it.dart';
import 'package:homeegram/core/network/api_client.dart.dart';
import 'package:homeegram/features/auth/data/datasources/auth_api_service.dart';
import 'package:homeegram/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:homeegram/features/auth/domain/repositories/auth_repository.dart';
import 'package:homeegram/features/auth/domain/usecases/generate_otp.dart';
import 'package:homeegram/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  // sl.registerSingleton<AuthLocalService>(
  //   AuthLocalServiceImpl()
  // );

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // Usecases
  sl.registerSingleton<GenerateOtpUseCase>(GenerateOtpUseCase());


  sl.registerFactory(() => AuthBloc(
        generateOtp: sl(),
      
      ));
}
