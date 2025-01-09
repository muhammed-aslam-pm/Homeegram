import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension NavigationExtensions on BuildContext {
  void pushLogin() {
    goNamed('login');
  }

  void pushOtpVerification() {
    goNamed('otp_verification');
  }
}
