import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homeegram/core/navigation/navigation_extensions.dart';
import 'package:homeegram/core/shared/animations/transformAnimation.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_back_page_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_button.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_top_section.dart';
import 'package:homeegram/features/auth/presentation/widgets/text_form_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return BaseAuthPageScaffold(
      topSection: LoginTopSection(text: localization!.signUp),
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
          left: screenWidth * 0.09,
          right: screenWidth * 0.09,
          top: screenHeight * 0.08,
          bottom: screenHeight * 0.14,
        ),
        child: AnimatedWrapper(
          child: Column(
            children: [
              const Spacer(),
              _buildNameTextField(context),
              SizedBox(height: screenHeight * 0.04),
              _buildIdTextField(context),
              SizedBox(height: screenHeight * 0.032),
              _buildIdDescription(context),
              const Spacer(),
              LoginButton(
                text: localization!.verifyAndProceedButton,
                onPressed: () {
                  context.pushChooseCategory();
                },
                height: screenHeight * 0.065,
              ),
            ],
          ),
        ));
  }

  _buildNameTextField(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return CustomTextFormField(
      hintText: localization!.profileName,
      prefixIcon: SizedBox(
          height: 30,
          width: 30,
          child:
              Center(child: Icon(Icons.person, color: Colors.grey, size: 20))),
    );
  }

  _buildIdTextField(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return CustomTextFormField(
      hintText: localization!.homeeId,
      prefixIcon: SizedBox(
          height: 30,
          width: 30,
          child:
              Center(child: Icon(Icons.person, color: Colors.grey, size: 20))),
    );
  }

  _buildIdDescription(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        localization!.homeeIdHint,
        style: TextStyle(
          fontSize: 15,
          color: AppColors.lightTextPrimary,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
