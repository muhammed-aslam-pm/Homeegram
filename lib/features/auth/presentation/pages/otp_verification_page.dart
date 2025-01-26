import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeegram/core/navigation/navigation_extensions.dart';
import 'package:homeegram/core/shared/animations/transformAnimation.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';
import 'package:homeegram/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_back_page_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_button.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_top_section.dart';
import 'package:homeegram/service_locator.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: const OtpVerificationView(),
    );
  }
}

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is OtpVerified) {
          context.pushSignUp();
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        final localization = AppLocalizations.of(context);

        return BaseAuthPageScaffold(
          topSection: LoginTopSection(text: localization!.otpVerification),
          bottomSection: _buildBottomSection(context, state),
          isScrollable: false,
        );
      },
    );
  }

  Widget _buildBottomSection(BuildContext context, AuthState state) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final localization = AppLocalizations.of(context);
    String otpValue = '';

    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.09,
        right: screenWidth * 0.09,
        top: screenHeight * 0.08,
        bottom: screenHeight * 0.14,
      ),
      child: AnimatedWrapper(
        child: Column(
          children: [
            _buildNumberSection(localization),
            const Spacer(),
            Pinput(
              onCompleted: (pin) {
                otpValue = pin;
                context.read<AuthBloc>().add(VerifyOtpEvent(pin));
              },
              onChanged: (value) {
                otpValue = value;
              },
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
                  color: AppColors.grey2,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              enabled: state is! AuthLoading,
            ),
            const Spacer(),
            _buildDidntRecieve(localization!),
            SizedBox(height: screenHeight * 0.035),
            LoginButton(
              text: localization.verifyAndProceedButton,
              onPressed: state is AuthLoading
                  ? null
                  : () {
                      if (otpValue.length == 6) {
                        context.read<AuthBloc>().add(VerifyOtpEvent(otpValue));
                      }
                    },
              height: screenHeight * 0.065,
              isLoading: state is AuthLoading ? true : false,
            ),
          ],
        ),
      ),
    );
  }

  Column _buildNumberSection(AppLocalizations? localization) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          localization!.otpInstruction,
          style: TextStyle(
            fontSize: 19,
            color: AppColors.lightTextPrimary,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
          textHeightBehavior: TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: false,
          ),
        ),
        Text(
          "91 7025169934",
          style: TextStyle(
              fontSize: 26,
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
              fontSize: 19,
              color: AppColors.lightTextPrimary,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            textHeightBehavior: TextHeightBehavior(
              applyHeightToFirstAscent: false,
              applyHeightToLastDescent: false,
            ),
          ),
          Text(
            localization!.resendOtp,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.lightPrimary,
              fontWeight: FontWeight.w500,
            ),
            textHeightBehavior: TextHeightBehavior(
              applyHeightToFirstAscent: false,
              applyHeightToLastDescent: false,
            ),
          ),
        ]);
  }
}
