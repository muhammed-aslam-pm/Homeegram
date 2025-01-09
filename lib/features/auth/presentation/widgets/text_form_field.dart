import 'package:flutter/material.dart';
import 'package:homeegram/core/theme/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? prefixText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final TextInputType keyboardType;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final int? maxLines;
  final int? minLines;
  final bool readOnly;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.hintStyle,
    this.labelStyle,
    this.textStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.minLines,
    this.readOnly = false,
    this.prefixText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: maxLines,
      minLines: minLines,
      readOnly: readOnly,
      decoration: InputDecoration(
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null)
              SizedBox(
                width: 10,
              ),
            if (prefixIcon != null) prefixIcon!, // Display the prefix icon
            if (prefixText != null) ...[
              const SizedBox(width: 8), // Add space between icon and text
              Text(
                prefixText!,
                style:
                    TextStyle(color: AppColors.darkTextPrimary, fontSize: 17),
              ),
            ],
            const SizedBox(
                width: 8), // Add space between prefixText and hintText
          ],
        ),
        // contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: AppColors.grey1,
            width: 3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 3,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: AppColors.error,
            width: 3,
          ),
        ),
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyle(color: Colors.grey.shade600),
        labelText: labelText,
        labelStyle: labelStyle ?? TextStyle(color: Colors.grey.shade800),
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: onSuffixIconTap,
                child: Icon(
                  suffixIcon,
                  color: Colors.grey.shade600,
                ),
              )
            : null,
      ),
      style: textStyle ?? TextStyle(color: Colors.black),
    );
  }
}
