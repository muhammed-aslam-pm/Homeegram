import 'package:flutter/material.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';

class WalletBackButton extends StatelessWidget {
  const WalletBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: AppColors.grey3),
        padding: EdgeInsets.all(5),
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 10),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.lightSurface,
            size: 16,
          ),
        ),
      ),
    );
  }
}
