import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:homeegram/core/navigation/navigation_extensions.dart';
import 'package:homeegram/core/shared/animations/transformAnimation.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';
import 'package:homeegram/core/utils/validators.dart';
import 'package:homeegram/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_back_page_layout.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_button.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_top_section.dart';
import 'package:homeegram/service_locator.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationPage extends StatelessWidget {
  final String phoneNumber; // Add a parameter for the phone number

  const OtpVerificationPage({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: OtpVerificationView(
          phoneNumber: phoneNumber), // Pass the phone number
    );
  }
}

class OtpVerificationView extends StatelessWidget {
  final String phoneNumber; // Add a parameter for the phone number

  OtpVerificationView({super.key, required this.phoneNumber});
  final TextEditingController _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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

    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.09,
        right: screenWidth * 0.09,
        top: screenHeight * 0.08,
        bottom: screenHeight * 0.14,
      ),
      child: AnimatedWrapper(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildNumberSection(localization),
              const Spacer(),
              Pinput(
                onCompleted: (pin) {
                  context
                      .read<AuthBloc>()
                      .add(VerifyOtpEvent(pin, phoneNumber));
                },
                controller: _otpController,
                showCursor: true,
                validator: (value) => Validators.validateOTP(value),
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
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                              VerifyOtpEvent(_otpController.text, phoneNumber));
                        }
                      },
                height: screenHeight * 0.065,
                isLoading: state is AuthLoading,
              ),
            ],
          ),
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
        ),
        Text(
          phoneNumber, // Use the dynamic phone number
          style: TextStyle(
            fontSize: 26,
            color: AppColors.lightTextPrimary,
            fontWeight: FontWeight.w500,
            height: 2,
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
}
