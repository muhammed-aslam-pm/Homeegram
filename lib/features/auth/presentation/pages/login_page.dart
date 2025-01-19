import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:homeegram/core/constants/icons.dart';
import 'package:homeegram/core/navigation/navigation_extensions.dart';
import 'package:homeegram/core/shared/animations/transformAnimation.dart';
import 'package:homeegram/core/shared/widgets/app_logo_with_text.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';
import 'package:homeegram/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_back_page_layout.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_button.dart';
import 'package:homeegram/features/auth/presentation/widgets/text_form_field.dart';
import 'package:homeegram/service_locator.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is OtpSent) {
          context.pushOtpVerification();
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return BaseAuthPageScaffold(
          topSection: _buildTopSection(context),
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
    final phoneController = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.09,
        vertical: screenHeight * 0.048,
      ),
      child: AnimatedWrapper(
        child: Column(
          children: [
            AppLogoWithText(height: screenHeight * 0.07),
            const Spacer(),
            CustomTextFormField(
              controller: phoneController,
              hintText: "Mobile",
              prefixIcon: const SizedBox(
                height: 30,
                width: 30,
                child: Center(
                  child: Text("🇮🇳", style: TextStyle(fontSize: 20)),
                ),
              ),
              prefixText: "+91",
            ),
            SizedBox(height: screenHeight * 0.03),
            LoginButton(
              text: localization!.getOtpButton,
              onPressed: state is AuthLoading
                  ? null
                  : () {
                      final phone = phoneController.text.trim();
                      if (phone.isNotEmpty) {
                        context.read<AuthBloc>().add(SendOtpEvent(phone));
                      }
                    },
              height: screenHeight * 0.06,
              // Show loading indicator if state is AuthLoading
              isLoading: state is AuthLoading
                  ? true
                  : false,
            ),
              const SizedBox(height: 20),
              const Spacer(),
              _buildOrDivider(localization: localization),
              const Spacer(),
              _buildGoogleButton(),
              const Spacer(),
              _buildTermsAndConditions(localization: localization),
            ],
          ),
        ));
  }

  Widget _buildTopSection(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final screenWidhth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return AnimatedWrapper(
      direction: AnimationDirection.top,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidhth * 0.07,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.07),
            Text(
              localization!.loginWelcome,
              style: TextStyle(
                  fontSize: 28,
                  color: AppColors.lightTextPrimary,
                  fontWeight: FontWeight.w500,
                  height: 2),
              textHeightBehavior: TextHeightBehavior(
                applyHeightToFirstAscent: true,
                applyHeightToLastDescent: false,
              ),
            ),
            Text(
              localization!.loginSubtitle1,
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
            FittedBox(
              child: Text(
                localization!.loginSubtitle2,
                style: TextStyle(
                    fontSize: 26,
                    color: AppColors.lightTextPrimary,
                    fontWeight: FontWeight.w400,
                    height: 2),
                textHeightBehavior: TextHeightBehavior(
                  applyHeightToFirstAscent: false,
                  applyHeightToLastDescent: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildMobileTextField() => CustomTextFormField(
        hintText: "Mobile",
        prefixIcon: SizedBox(
            height: 30,
            width: 30,
            child: Center(
                child: Text(
              "🇮🇳",
              style: TextStyle(fontSize: 20),
            ))),
        prefixText: "+91",
      );
  _buildTermsAndConditions({
    required AppLocalizations? localization,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 26,
            width: 26,
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.done,
                  size: 12,
                  color: AppColors.textWhite,
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      AppColors.success.withValues(alpha: 0.7)),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          FittedBox(fit: BoxFit.fitWidth,
            child: Text(
              localization!.agreeTerms,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: AppColors.grey1),
            ),
          )
        ],
      );
  _buildGoogleButton() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.grey1, width: 3),
        ),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppIcons.googleIcon,
              height: 21,
              width: 21,
            ),
            SizedBox(width: 5),
            Text(
              "Google",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
  _buildOrDivider({
    required AppLocalizations? localization,
  }) =>
      Row(
        children: [
          Expanded(
            child: Container(
              height: 2,
              // width: double.infinity,
              color: AppColors.lightTextPrimary,
            ),
          ),
          SizedBox(width: 10),
          Text(
            localization!.orContinueWith,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 2,
              // width: double.infinity,
              color: AppColors.lightTextPrimary,
            ),
          )
        ],
      );
}
