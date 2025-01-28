// lib/features/wallet/presentation/widgets/wallet_action_button.dart
import 'package:flutter/material.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';

class WalletActionButton extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  const WalletActionButton({
    super.key,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: ListTile(
        leading: Icon(Icons.account_balance_wallet_rounded,
            color: AppColors.lightTextPrimary),
        title: Text(label),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600, color: AppColors.lightTextPrimary),
        trailing: Icon(Icons.chevron_right_rounded, color: AppColors.grey1),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        onTap: onTap,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: AppColors.grey2)),
      ),
    );
  }
}
