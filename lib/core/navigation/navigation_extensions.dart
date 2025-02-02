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

  void pushWalletPage() {
    pushNamed('wallet');
  }
  void pushMyWalletPage() {
    pushNamed('my_wallet');
  }

  void pushUpgradeWalletPage() {
    pushNamed('upgrade_wallet');
  }

  void pushGiftCoinPage() {
    pushNamed('gift_coin');
  }

  void walletVerificationPage() {
    pushNamed('wallet_verification');
  }

  void successScreen() {
    pushNamed('success_screen');
  }

  void pushRefferalHistory() {
    pushNamed('refferal_history');
  }

  void pushWalletHistory() {
    pushNamed('wallet_history');
  }
}
