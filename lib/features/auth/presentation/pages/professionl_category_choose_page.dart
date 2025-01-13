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

class ProfessionalCategoryChoosePage extends StatefulWidget {
  const ProfessionalCategoryChoosePage({super.key});

  @override
  _ProfessionalCategoryChoosePageState createState() =>
      _ProfessionalCategoryChoosePageState();
}

class _ProfessionalCategoryChoosePageState
    extends State<ProfessionalCategoryChoosePage> {
  bool isFirstButtonExpanded = false; // Tracks the state of the first button

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return BaseAuthPageScaffold(
      topSection:
          LoginTopSection(text: localization!.chooseProfessionalCategoryTitle),
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
          top: screenHeight * 0.05,
          bottom: screenHeight * 0.06,
        ),
        child: AnimatedWrapper(
          child: Column(
            children: [
              _buildNumberSection(localization!),
              SizedBox(height: screenHeight * 0.03),
              LoginButton(
                text: localization.nextButton,
                onPressed: () {
                  context.pushProfileInformationFormPage();
                },
                height: screenHeight * 0.07,
              ),
            ],
          ),
        ));
  }

  _buildNumberSection(AppLocalizations localization) {
    List<String> interests = [
      "Consultancy",
      "Bank Loan",
      "Real Estate",
      "Builders",
      "Architect",
      "Civil Engineers",
      "Interior Design",
      "Landscape",
      "Automation",
      "Design Student",
      "Aluminum Fabrication",
      "Cad & 3D",
      "Carpenter",
      "Carpet",
      "Cleaning",
      "CNC Cutting",
      "Contractor",
      "Curtain",
      "Decor",
      "Earth Movers",
      "Electrical",
      "Event",
      "Flooring"
    ];
    return Expanded(
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: interests
              .map((interest) => Chip(
                    labelStyle: TextStyle(
                        color: AppColors.lightTextPrimary, fontSize: 14),
                    label: Text(interest),
                    side: BorderSide(width: 0, style: BorderStyle.none),
                    color: WidgetStatePropertyAll(AppColors.grey2),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
