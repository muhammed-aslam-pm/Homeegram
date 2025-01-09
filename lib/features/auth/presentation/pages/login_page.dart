import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:homeegram/core/constants/icons.dart';
import 'package:homeegram/core/constants/images.dart';
import 'package:homeegram/core/shared/widgets/app_logo_with_text.dart';
import 'package:homeegram/core/theme/app_colors.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_back_page_layout.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_button.dart';
import 'package:homeegram/features/auth/presentation/widgets/text_form_field.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final _localization = AppLocalizations.of(context);

//     return Scaffold(
//       backgroundColor: AppColors.lightPrimary,
//       body: Column(
//         children: [
//           Expanded(flex: 2, child: _buildTopSection(context)),
//           Expanded(
//             flex: 4,
//             child: Container(
//               width: double.infinity,
//               height: double.infinity,
//               decoration: BoxDecoration(
//                 color: AppColors.lightSurface,
//                 borderRadius: BorderRadius.vertical(
//                   top: Radius.circular(50),
//                 ),
//               ),
//               padding: EdgeInsets.all(10),
//               child: _buildBottomSection(context),
//             ),
//           )
//         ],
//       ),
//     );
//   }

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      topContent: _buildTopSection(context),
      bottomContent: _buildBottomSection(context),
      backgroundColor: AppColors.lightPrimary,
      surfaceColor: AppColors.lightSurface,
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidhth = MediaQuery.of(context).size.width;
    final _localization = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.only(
          right: _screenWidhth * 0.07,
          left: _screenWidhth * 0.07,
          bottom: _screenHeight * 0.05,
          top: _screenHeight * 0.01),
      child: Column(
        children: [
          AppLogoWithText(height: _screenHeight * 0.08),
          Spacer(),
          _buildMobileTextField(),
          SizedBox(
            height: _screenHeight * 0.03,
          ),
          LoginButton(
            text: _localization!.getOtpButton,
            onPressed: () {},
            height: _screenHeight * 0.07,
          ),
          SizedBox(height: 20),
          Spacer(),
          _buildOrDivider(localization: _localization),
          Spacer(),
          _buildGoogleButton(),
          Spacer(),
          _buildTermsAndConditions(localization: _localization)
        ],
      ),
    );
  }

  Widget _buildTopSection(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidhth = MediaQuery.of(context).size.width;
    final _localization = AppLocalizations.of(context);
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _screenWidhth * 0.08,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _localization!.loginWelcome,
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
              _localization!.loginSubtitle1,
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
            Text(
              _localization!.loginSubtitle2,
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
          ],
        ),
      ),
    );
  }
}

class _buildMobileTextField extends StatelessWidget {
  const _buildMobileTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
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
  }
}

class _buildTermsAndConditions extends StatelessWidget {
  const _buildTermsAndConditions({
    super.key,
    required AppLocalizations? localization,
  }) : _localization = localization;

  final AppLocalizations? _localization;

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Text(
          _localization!.agreeTerms,
          style: TextStyle(color: AppColors.grey1),
        )
      ],
    );
  }
}

class _buildGoogleButton extends StatelessWidget {
  const _buildGoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.grey1, width: 3),
      ),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppIcons.googleIcon,
            height: 22,
            width: 22,
          ),
          SizedBox(width: 5),
          Text(
            "Google",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class _buildOrDivider extends StatelessWidget {
  const _buildOrDivider({
    super.key,
    required AppLocalizations? localization,
  }) : _localization = localization;

  final AppLocalizations? _localization;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 3,
            // width: double.infinity,
            color: AppColors.lightTextPrimary,
          ),
        ),
        SizedBox(width: 10),
        Text(
          _localization!.orContinueWith,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 3,
            // width: double.infinity,
            color: AppColors.lightTextPrimary,
          ),
        )
      ],
    );
  }
}
