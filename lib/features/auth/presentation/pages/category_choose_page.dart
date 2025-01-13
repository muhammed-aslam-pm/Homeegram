import 'package:flutter/material.dart';
import 'package:homeegram/core/navigation/navigation_extensions.dart';
import 'package:homeegram/core/shared/animations/transformAnimation.dart';
import 'package:homeegram/core/theme/app_colors.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_back_page_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_button.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_top_section.dart';
import 'package:pinput/pinput.dart';
import 'package:go_router/go_router.dart';

class CategoryChoosePage extends StatefulWidget {
  const CategoryChoosePage({super.key});

  @override
  _CategoryChoosePageState createState() => _CategoryChoosePageState();
}

class _CategoryChoosePageState extends State<CategoryChoosePage> {
  bool isFirstButtonExpanded = false; // Tracks the state of the first button

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return BaseAuthPageScaffold(
      topSection: LoginTopSection(text: localization!.chooseCategoryTitle),
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
            const Spacer(),
            _buildButtons(context),
            const Spacer(),
            LoginButton(
              text: localization!.nextButton,
              onPressed: () {
                context.pushInterestSelectionPage();
              },
              height: screenHeight * 0.07,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        _buildFirstButton(context, localization!.homeOwner),
        if (!isFirstButtonExpanded) ...[
          SizedBox(height: screenHeight * 0.035),
          _buildButton(context, localization!.professionals),
          SizedBox(height: screenHeight * 0.035),
          _buildButton(context, localization!.shopMaterials),
        ]
      ],
    );
  }

  Widget _buildFirstButton(BuildContext context, String title) {
    final isExpanded =
        isFirstButtonExpanded; // Check if the first button is expanded

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: double.infinity,
      // padding: const EdgeInsets.symmetric(vertical: 16),

      child: Column(
        children: [
          Stack(children: [
            Container(
              width: double.infinity,
              // padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                border: Border.all(color: AppColors.grey2, width: 3),
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.lightTextPrimary,
                  fontWeight: FontWeight.w500,
                  height: 2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              top: 0,
              right: 20,
              bottom: 0,
              child: Align(
                alignment: Alignment.center,
                child: IconButton.outlined(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 3), fixedSize: Size(37, 37)),
                  iconSize: 20,
                  onPressed: () {
                    setState(() {
                      // Toggle the state of the first button
                      isFirstButtonExpanded = !isFirstButtonExpanded;
                    });
                  },
                  icon: Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: AppColors.lightTextPrimary,
                    size: 20,
                  ),
                ),
              ),
            ),
          ]),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.grey2,
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.all(20),
                child: Text(
                  "Home Owner, who joined our family for finding new home designs & trending materials.",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.lightTextPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String title) {
    return Container(
      width: double.infinity,
      // padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        border: Border.all(color: AppColors.grey2, width: 3),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          color: AppColors.lightTextPrimary,
          fontWeight: FontWeight.w500,
          height: 2,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
