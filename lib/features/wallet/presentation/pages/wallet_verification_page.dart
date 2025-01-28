import 'package:flutter/material.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';
import 'package:homeegram/core/navigation/navigation_extensions.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_button.dart';
import 'package:homeegram/features/wallet/presentation/widgets/wallet_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pinput/pinput.dart';

class WalletVerificationPage extends StatelessWidget {
  const WalletVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final localization = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            WalletAppBar(title: "Verification"),
            SizedBox(height: screenSize.height * 0.1),
            _buildNumberSection(context),
            SizedBox(height: screenSize.height * 0.1),
            _buildPinInput(),
            SizedBox(height: screenSize.height * 0.1),
            _buildDidntRecieve(localization!),
            SizedBox(height: screenSize.height * 0.1),
            _buildProceedButton(context, screenSize.height),
            Spacer(),
          ],
        ),
      )),
    );
  }

  Pinput _buildPinInput() {
    return Pinput(
      // controller: _otpController,
      showCursor: true,
      defaultPinTheme: PinTheme(
        width: 54,
        height: 54,
        textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
            // color: AppColors.grey2,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.grey1, width: 2)),
      ),
      // enabled: state is! AuthLoading,
    );
  }

  Text _buildNumberSection(BuildContext context) {
    return Text("Enter OTP Number shared to\n91 1234567890 & test@gmail.com",
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.w600));
  }

  Column _buildDidntRecieve(AppLocalizations localization) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          localization.didNotReceiveOtp,
          style: TextStyle(
            fontSize: 19,
            color: AppColors.lightTextPrimary,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          localization.resendOtp,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.lightPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildProceedButton(BuildContext context, double screenHeight) {
    return LoginButton(
      text: "Proceed",
      onPressed: () {
        context.successScreen();
      },
      height: screenHeight * 0.06,
    );
  }
}
