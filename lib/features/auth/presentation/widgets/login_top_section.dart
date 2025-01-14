import 'package:flutter/material.dart';
import 'package:homeegram/core/shared/animations/transformAnimation.dart';
import 'package:homeegram/core/shared/widgets/app_logo_with_text.dart';
import 'package:homeegram/core/theme/app_colors.dart';

class LoginTopSection extends StatelessWidget {
  final String text;

  const LoginTopSection({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return AnimatedWrapper(
      direction: AnimationDirection.top,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.09,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 20),
            AppLogoWithText(
              height: screenHeight * 0.07,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 28,
                color: AppColors.lightTextPrimary,
                fontWeight: FontWeight.w500,
                // height: 2,
              ),
              textScaler: TextScaler.linear(0.95),
            ),
          ],
        ),
      ),
    );
  }
}
