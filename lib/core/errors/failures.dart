import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.server([String? message]) = _ServerFailure;
  const factory Failure.network() = _NetworkFailure;
  const factory Failure.invalidCredentials() = _InvalidCredentialsFailure;
  const factory Failure.unexpected() = _UnexpectedFailure;
}

// Extension to handle user-friendly messages
extension FailureMessage on Failure {
  String get userMessage {
    return when(
      server: (String? message) =>
          message ?? 'Server error occurred. Please try again.',
      network: () => 'Please check your internet connection.',
      invalidCredentials: () => 'Invalid username or password.',
      unexpected: () => 'An unexpected error occurred. Please try again.',
    );
  }
}
