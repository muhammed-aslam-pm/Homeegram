import 'package:flutter/material.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';

class WalletMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const WalletMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.lightPrimary.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppColors.lightPrimary,
              size: 20,
            ),
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.lightTextPrimary,
                  fontWeight: FontWeight.w500,
                ),
          ),
          trailing: Icon(
            Icons.chevron_right_rounded,
            color: AppColors.grey1,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        ),
        const Divider(height: 1, color: AppColors.grey2),
      ],
    );
  }
}
