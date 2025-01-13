import 'package:flutter/material.dart';
import 'package:homeegram/core/theme/app_colors.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final void Function(String?)? onChanged;
  const CustomDropdown({
    super.key,
    required this.items,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: items
          .map(
            (e) => DropdownMenuItem(value: e, child: Text(e)),
          )
          .toList(),
      onChanged: (value) {
        print(value);
      },
      hint: Text(items.first),
      itemHeight: 50,
      decoration: InputDecoration(
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
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
    );
  }
}
