part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class OtpSent extends AuthState {}

class OtpVerified extends AuthState {}

class SignUpSuccess extends AuthState {}

class CategorySelected extends AuthState {
  final String category;
  final String? subCategory;

  CategorySelected({required this.category, this.subCategory});
}

class InterestsSelected extends AuthState {
  final List<String> interests;
  InterestsSelected(this.interests);
}

class ProfileSaved extends AuthState {}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure({required this.error});
}
