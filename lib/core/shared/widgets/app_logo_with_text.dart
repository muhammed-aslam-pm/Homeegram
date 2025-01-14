import 'package:flutter/material.dart';
import 'package:homeegram/core/constants/images.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';

class AppLogoWithText extends StatelessWidget {
  final double? height;
  final double? widht;
  const AppLogoWithText({
    super.key,
    this.height,
    this.widht,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 100,
      width: widht ?? double.infinity,
      decoration: BoxDecoration(
          color: AppColors.lightSurface,
          borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.lightPrimary,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(
                AppImages.hemeeIcon,
                color: AppColors.darkTextPrimary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Image.asset(
              AppImages.hemeeText,
              color: AppColors.darkTextPrimary,
            ),
          )
        ],
      ),
    );
  }
}
