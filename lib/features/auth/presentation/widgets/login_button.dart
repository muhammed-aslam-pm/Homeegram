import 'package:flutter/material.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;

  const LoginButton({
    required this.text,
    required this.onPressed,
    this.width,
    this.height = 100.0,
    this.isLoading = false,
    this.backgroundColor = AppColors.lightPrimary,
    this.textColor = AppColors.lightTextPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(textColor!),
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
