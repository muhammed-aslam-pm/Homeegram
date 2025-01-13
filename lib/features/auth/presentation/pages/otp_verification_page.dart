import 'package:flutter/material.dart';
import 'package:homeegram/core/navigation/navigation_extensions.dart';
import 'package:homeegram/core/shared/animations/transformAnimation.dart';
import 'package:homeegram/core/theme/app_colors.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_back_page_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_button.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_top_section.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return BaseAuthPageScaffold(
      topSection: LoginTopSection(text: localization!.otpVerification),
      bottomSection: _buildBottomSection(context),
      isScrollable: false,
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final localization = AppLocalizations.of(context);

    return Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.07,
          right: screenWidth * 0.07,
          top: screenHeight * 0.08,
          bottom: screenHeight * 0.14,
        ),
        child: AnimatedWrapper(
          child: Column(
            children: [
              _buildNumberSection(localization),
              const Spacer(),
              _buildInputField(),
              const Spacer(),
              // _buildMobileTextField(),

              _buildDidntRecieve(localization!),
              SizedBox(height: screenHeight * 0.035),
              LoginButton(
                text: localization!.verifyAndProceedButton,
                onPressed: () {
                  context.pushSignUp();
                },
                height: screenHeight * 0.07,
              ),
            ],
          ),
        ));
  }

  Column _buildNumberSection(AppLocalizations? localization) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          localization!.otpInstruction,
          style: TextStyle(
              fontSize: 21,
              color: AppColors.lightTextPrimary,
              fontWeight: FontWeight.w500,
              height: 2),
          textAlign: TextAlign.center,
          textHeightBehavior: TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: false,
          ),
        ),
        Text(
          "91 7025169934",
          style: TextStyle(
              fontSize: 28,
              color: AppColors.lightTextPrimary,
              fontWeight: FontWeight.w500,
              height: 2),
          textHeightBehavior: TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: false,
          ),
        ),
      ],
    );
  }

  Column _buildDidntRecieve(AppLocalizations localization) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            localization!.didNotReceiveOtp,
            style: TextStyle(
                fontSize: 21,
                color: AppColors.lightTextPrimary,
                fontWeight: FontWeight.w500,
                height: 2),
            textAlign: TextAlign.center,
            textHeightBehavior: TextHeightBehavior(
              applyHeightToFirstAscent: false,
              applyHeightToLastDescent: false,
            ),
          ),
          Text(
            localization!.resendOtp,
            style: TextStyle(
                fontSize: 18,
                color: AppColors.lightPrimary,
                fontWeight: FontWeight.w500,
                height: 2),
            textHeightBehavior: TextHeightBehavior(
              applyHeightToFirstAscent: false,
              applyHeightToLastDescent: false,
            ),
          ),
        ]);
  }

  _buildInputField() {
    return Pinput(
      onCompleted: (pin) => print(pin),
      showCursor: true,
      defaultPinTheme: PinTheme(
        width: 56,
        height: 56,
        textStyle: TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(30, 60, 87, 1),
            fontWeight: FontWeight.w600),
        decoration: BoxDecoration(
          color: AppColors.grey2,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
