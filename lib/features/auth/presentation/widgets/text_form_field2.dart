import 'package:flutter/material.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';

class CustomTextField2 extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final int maxLines;
  final TextInputType keyboardType;
  final bool isRequired;
  final EdgeInsetsGeometry contentPadding;

  const CustomTextField2({
    Key? key,
    this.label,
    this.hint,
    this.controller,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.isRequired = false,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      cursorColor: AppColors.lightTSecondary,
      decoration: InputDecoration(
        label: label != null
            ? Text(
                label!,
                style: TextStyle(color: AppColors.grey1),
              )
            : null,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 3,
              color: AppColors.lightTSecondary,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 3,
              color: AppColors.lightTSecondary,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 3,
              color: AppColors.lightTSecondary,
            )),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 3,
              color: AppColors.lightTSecondary,
            )),
        contentPadding: contentPadding,
      ),
    );
  }
}
