import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension NavigationExtensions on BuildContext {
  void pushLogin() {
    goNamed('login'); // Push to login
  }

  void pushOtpVerification() {
    pushNamed('otp_verification');
  }

  void pushSignUp() {
    pushNamed('signup');
  }

  void pushChooseCategory() {
    pushNamed('choose_category');
  }

  void pushInterestSelectionPage() {
    pushNamed('intersets_selection');
  }

  void pushProfessionalCategoryChoosePage() {
    pushNamed('professional_category_choose');
  }

  void pushProfileInformationFormPage() {
    pushNamed('profile_information_form');
  }
}
