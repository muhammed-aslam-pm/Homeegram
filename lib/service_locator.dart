import 'package:get_it/get_it.dart';
import 'package:homeegram/core/network/api_client.dart.dart';
import 'package:homeegram/core/network/network_info.dart';
import 'package:homeegram/features/auth/data/datasources/auth_api_service.dart';
import 'package:homeegram/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:homeegram/features/auth/domain/repositories/auth_repository.dart';
import 'package:homeegram/features/auth/domain/usecases/generate_otp.dart';
import 'package:homeegram/features/auth/domain/usecases/sign_up.dart';
import 'package:homeegram/features/auth/domain/usecases/verify_otp.dart';
import 'package:homeegram/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // Register InternetConnectionChecker first
  sl.registerSingleton<InternetConnectionChecker>(
      InternetConnectionChecker.instance);

  // Register NetworkInfo (depends on InternetConnectionChecker)
  sl.registerSingleton<NetworkInfo>(NetworkInfoImpl(sl()));

  // Dio Client
  sl.registerSingleton<ApiClient>(ApiClient());

  // Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl(apiClient: sl()));

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(
    apiService: sl(),
    networkInfo: sl(),
  ));

  // Usecases
  sl.registerSingleton<SendOtp>(SendOtp(repository: sl()));
  sl.registerSingleton<VerifyOtp>(VerifyOtp(repository: sl()));
  sl.registerSingleton<SignUp>(SignUp(repository: sl()));

  // BLoCs
  sl.registerFactory(() => AuthBloc(generateOtp: sl(), verifyOtp: sl()));
}
