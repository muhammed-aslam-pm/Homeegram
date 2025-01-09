import 'package:flutter/material.dart';
import 'package:homeegram/core/shared/animations/transformAnimation.dart';
import 'package:homeegram/core/shared/widgets/app_logo_with_text.dart';
import 'package:homeegram/core/theme/app_colors.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_back_page_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_button.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePageScaffold(
      topSection: _buildTopSection(context),
      bottomSection: _buildBottomSection(context),
      isScrollable: false, // Set to true if content needs scrolling
    );
  }

  Widget _buildTopSection(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final screenWidhth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return AnimatedWrapper(
      duration: const Duration(milliseconds: 500),
      translateY: 50,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidhth * 0.08,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 20),
            AppLogoWithText(
              height: screenHeight * 0.09,
            ),
            Text(
              localization!.otpVerification,
              style: TextStyle(
                  fontSize: 34,
                  color: AppColors.lightTextPrimary,
                  fontWeight: FontWeight.w500,
                  height: 2),
              textHeightBehavior: TextHeightBehavior(
                applyHeightToFirstAscent: false,
                applyHeightToLastDescent: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final localization = AppLocalizations.of(context);

    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.07,
          vertical: screenHeight * 0.08,
        ),
        child: AnimatedWrapper(
          duration: const Duration(milliseconds: 500),
          translateY: 50,
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
                onPressed: () {},
                height: screenHeight * 0.07,
              ),

              // const SizedBox(height: 20),
              // const Spacer(),
              // _buildOrDivider(localization: localization),
              // const Spacer(),
              // _buildGoogleButton(),
              // const Spacer(),
              // _buildTermsAndConditions(localization: localization),
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
