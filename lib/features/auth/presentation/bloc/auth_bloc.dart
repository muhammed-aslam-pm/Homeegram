import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:homeegram/features/auth/data/models/generate_otp_prams.dart';
import 'package:homeegram/features/auth/domain/usecases/generate_otp.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SendOtp generateOtp;

  // Add other use cases as needed

  AuthBloc({
    required this.generateOtp,
  }) : super(AuthInitial()) {
    on<SendOtpEvent>(_onSendOtp);
    // on<VerifyOtpEvent>(_onVerifyOtp);
    // on<SignUpEvent>(_onSignUp);
    on<SelectCategoryEvent>(_onSelectCategory);
    on<SelectInterestsEvent>(_onSelectInterests);
    on<SaveProfileEvent>(_onSaveProfile);
  }

  Future<void> _onSendOtp(SendOtpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final params = GenerateOtpParams(phoneNumber: event.phoneNumber);
      final result = await generateOtp(event.phoneNumber);
      log(result.toString());
      result.fold(
        (failure) => emit(AuthFailure(error: failure.toString())),
        (_) => emit(OtpSent()),
      );
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  // Future<void> _onVerifyOtp(VerifyOtpEvent event, Emitter<AuthState> emit) async {
  //   emit(AuthLoading());
  //   try {
  //     final result = await login(LoginParams(otp: event.otp));
  //     result.fold(
  //       (failure) => emit(AuthError(failure.toString())),
  //       (_) => emit(OtpVerified()),
  //     );
  //   } catch (e) {
  //     emit(AuthError(e.toString()));
  //   }
  // }

  // Future<void> _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
  //   emit(AuthLoading());
  //   try {
  //     final result = await register(
  //       RegisterParams(
  //         userId: event.userId,
  //         username: event.username,
  //       ),
  //     );
  //     result.fold(
  //       (failure) => emit(AuthError(failure.toString())),
  //       (_) => emit(SignUpComplete()),
  //     );
  //   } catch (e) {
  //     emit(AuthError(e.toString()));
  //   }
  // }

  Future<void> _onSelectCategory(
    SelectCategoryEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(CategorySelected(
        category: event.category, subCategory: event.subCategory));
  }

  Future<void> _onSelectInterests(
    SelectInterestsEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(InterestsSelected(event.interests));
  }

  Future<void> _onSaveProfile(
    SaveProfileEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      // Implement profile saving logic here
      // You'll need to create a use case for this
      emit(ProfileSaved());
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }
}
