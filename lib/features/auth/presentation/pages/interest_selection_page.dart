import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:homeegram/core/navigation/navigation_extensions.dart';
import 'package:homeegram/core/shared/animations/transformAnimation.dart';
import 'package:homeegram/core/theme/app_colors.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_back_page_layout.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_button.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_top_section.dart';

class InterestSelectionPage extends StatelessWidget {
  const InterestSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;

    return BaseAuthPageScaffold(
      topSection: LoginTopSection(text: localization!.selectInterestsTitle),
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
              _buildNumberSection(localization!),
              Spacer(),
              LoginButton(
                text: localization.verifyAndProceedButton,
                onPressed: () {
                  context.pushProfessionalCategoryChoosePage();
                },
                height: screenHeight * 0.07,
              ),
            ],
          ),
        ));
  }

  _buildNumberSection(AppLocalizations localization) {
    List<String> interests = [
      localization.interestArchitecture,
      localization.interestRealEstate,
      localization.interestLandscape,
      localization.interestInteriorDesign,
      localization.interestDecors,
      localization.interestAutomation,
    ];
    return Wrap(
      spacing: 20,
      runSpacing: 10,
      children: interests
          .map((interest) => Chip(
                labelStyle:
                    TextStyle(color: AppColors.lightTextPrimary, fontSize: 20),
                label: Text(interest),
                side: BorderSide(width: 0, style: BorderStyle.none),
                color: WidgetStatePropertyAll(AppColors.grey2),
              ))
          .toList(),
    );
  }
}
