part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SendOtpEvent extends AuthEvent {
  final String phoneNumber;
  SendOtpEvent(this.phoneNumber);
}

class VerifyOtpEvent extends AuthEvent {
  final String otp;
  VerifyOtpEvent(this.otp);
}

class SignUpEvent extends AuthEvent {
  final String userId;
  final String username;
  SignUpEvent(this.userId, this.username);
}

class SelectCategoryEvent extends AuthEvent {
  final String category; // 'homeowner', 'professional', or 'shop'
  final String? subCategory; // Optional for professionals
  SelectCategoryEvent(this.category, this.subCategory);
}

class SelectInterestsEvent extends AuthEvent {
  final List<String> interests;
  SelectInterestsEvent(this.interests);
}

class SaveProfileEvent extends AuthEvent {
  final Map<String, dynamic> profileData;
  SaveProfileEvent(this.profileData);
}
