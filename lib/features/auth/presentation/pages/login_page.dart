import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:homeegram/core/constants/icons.dart';
import 'package:homeegram/core/constants/images.dart';
import 'package:homeegram/core/navigation/navigation_extensions.dart';
import 'package:homeegram/core/shared/animations/transformAnimation.dart';
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

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePageScaffold(
      topSection: _buildTopSection(context),
      bottomSection: _buildBottomSection(context),
      isScrollable: false, // Set to true if content needs scrolling
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final localization = AppLocalizations.of(context);

    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.07,
          vertical: screenHeight * 0.045,
        ),
        child: AnimatedWrapper(
          duration: const Duration(milliseconds: 500),
          translateY: 50,
          child: Column(
            children: [
              AppLogoWithText(height: screenHeight * 0.08),
              const Spacer(),
              _buildMobileTextField(),
              SizedBox(height: screenHeight * 0.03),
              LoginButton(
                text: localization!.getOtpButton,
                onPressed: () {
                  context.pushOtpVerification();
                },
                height: screenHeight * 0.07,
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
    return AnimatedWrapper(
      duration: const Duration(milliseconds: 500),
      translateY: 50,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidhth * 0.08,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
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
            Text(
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
          Expanded(
            child: Text(
              localization!.agreeTerms,
              textAlign: TextAlign.center,
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
  _buildOrDivider({
    required AppLocalizations? localization,
  }) =>
      Row(
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
            localization!.orContinueWith,
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

//   Widget _buildTopSection(BuildContext context) {
//     final _screenHeight = MediaQuery.of(context).size.height;
//     final _screenWidhth = MediaQuery.of(context).size.width;
//     final _localization = AppLocalizations.of(context);
//     return SizedBox(
//       width: double.infinity,
//       child: Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: _screenWidhth * 0.08,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               _localization!.loginWelcome,
//               style: TextStyle(
//                   fontSize: 28,
//                   color: AppColors.lightTextPrimary,
//                   fontWeight: FontWeight.w500,
//                   height: 2),
//               textHeightBehavior: TextHeightBehavior(
//                 applyHeightToFirstAscent: true,
//                 applyHeightToLastDescent: false,
//               ),
//             ),
//             Text(
//               _localization!.loginSubtitle1,
//               style: TextStyle(
//                   fontSize: 34,
//                   color: AppColors.lightTextPrimary,
//                   fontWeight: FontWeight.w500,
//                   height: 2),
//               textHeightBehavior: TextHeightBehavior(
//                 applyHeightToFirstAscent: false,
//                 applyHeightToLastDescent: false,
//               ),
//             ),
//             Text(
//               _localization!.loginSubtitle2,
//               style: TextStyle(
//                   fontSize: 26,
//                   color: AppColors.lightTextPrimary,
//                   fontWeight: FontWeight.w400,
//                   height: 2),
//               textHeightBehavior: TextHeightBehavior(
//                 applyHeightToFirstAscent: false,
//                 applyHeightToLastDescent: false,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
