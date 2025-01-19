part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class OtpSent extends AuthState {}

class OtpVerified extends AuthState {}

class SignUpComplete extends AuthState {}

class CategorySelected extends AuthState {
  final String category;
  CategorySelected(this.category);
}

class InterestsSelected extends AuthState {
  final List<String> interests;
  InterestsSelected(this.interests);
}

class ProfileSaved extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
