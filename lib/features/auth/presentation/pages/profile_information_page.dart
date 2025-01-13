import 'package:flutter/material.dart';
import 'package:homeegram/core/navigation/navigation_extensions.dart';
import 'package:homeegram/core/shared/animations/transformAnimation.dart';
import 'package:homeegram/core/theme/app_colors.dart';
import 'package:homeegram/features/auth/presentation/widgets/custom_drop_down.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_back_page_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_button.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_top_section.dart';
import 'package:homeegram/features/auth/presentation/widgets/text_form_field2.dart';
import 'package:pinput/pinput.dart';
import 'package:go_router/go_router.dart';

class ProfileInformationFormPage extends StatelessWidget {
  ProfileInformationFormPage({super.key});

  bool isFirstButtonExpanded = false;
  // Tracks the state of the first button
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return BaseAuthPageScaffold(
      topSection: LoginTopSection(text: localization!.profileInformationTitle),
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
              _buildFormSection(localization!, context),
              SizedBox(height: screenHeight * 0.03),
              LoginButton(
                text: localization.saveButton,
                onPressed: () {
                  context.pop();
                },
                height: screenHeight * 0.07,
              ),
            ],
          ),
        ));
  }

  _buildFormSection(AppLocalizations localization, BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Expanded(
      child: SingleChildScrollView(
          child: Column(
        spacing: screenHeight * 0.03,
        children: [
          SizedBox(height: 5),
          CustomTextField2(
            label: localization.profileTaglineLabel,
          ),
          CustomTextField2(
            label: localization.bioLabel,
            maxLines: 3,
          ),
          CustomTextField2(
            label: localization.companyNameLabel,
          ),
          CustomTextField2(
            label: localization.websiteAddressLabel,
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: CustomTextField2(
                  label: localization.experienceLabel,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: CustomDropdown(
                  items: ["Month", "Year"],
                ),
              )
            ],
          ),
          CustomTextField2(
            label: localization.registrationNumberLabel,
          ),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: CustomTextField2(
                  label: localization.achievementsLabel,
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Center(
                    child: IconButton.filled(
                        onPressed: () {}, icon: Icon(Icons.add)),
                  ))
            ],
          ),
          CustomTextField2(
            label: localization.officeTimeLabel,
          ),
          CustomTextField2(
            label: localization.servicesProvidedLabel,
          ),
          CustomTextField2(
            label: localization.officeAddressLabel,
          ),
        ],
      )),
    );
  }
}
