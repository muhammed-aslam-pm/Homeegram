import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension NavigationExtensions on BuildContext {
  void pushLogin() {
    goNamed('login');
  }

  void pushOtpVerification({required String phoneNumber}) {
    goNamed(
      'otp_verification',
      extra: phoneNumber,
    );
  }

  void pushSignUp() {
    goNamed('signup');
  }

  void pushChooseCategory() {
    goNamed('choose_category');
  }

  void pushInterestSelectionPage() {
    goNamed('intersets_selection');
  }

  void pushProfessionalCategoryChoosePage() {
    goNamed('professional_category_choose');
  }

  void pushProfileInformationFormPage() {
    goNamed('profile_information_form');
  }

  void pushMyWalletPage() {
    goNamed('my_wallet');
  }
}
