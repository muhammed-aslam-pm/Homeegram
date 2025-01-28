import 'package:flutter/material.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';
import 'package:homeegram/core/constants/icons.dart';

class CoinBalance extends StatelessWidget {
  final String coins;
  const CoinBalance(this.coins);

  static const _containerPadding = EdgeInsets.only(
    top: 3,
    bottom: 3,
    right: 10,
    left: 5,
  );
  static const _iconSize = 25.0;
  static const _textSpacing = 4.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.grey2,
      ),
      padding: _containerPadding,
      child: Row(
        children: [
          Image.asset(
            AppIcons.coinIcon,
            height: _iconSize,
            width: _iconSize,
          ),
          const SizedBox(width: _textSpacing),
          Text(
            coins,
            style: TextStyle(
              color: AppColors.lightTextPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
