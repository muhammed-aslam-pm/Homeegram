import 'package:flutter/material.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';
import 'package:homeegram/core/constants/icons.dart';

class ReferralCard extends StatelessWidget {
  final String referralId;
  final String dateTime;
  final int coins;

  const ReferralCard({
    Key? key,
    required this.referralId,
    required this.dateTime,
    required this.coins,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.lightSurface,
        border: Border.all(color: AppColors.containerBorder, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Referal ID : $referralId",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.lightTextPrimary,
            ),
          ),
          Text(
            "Date & Time : $dateTime",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.lightTextPrimary,
            ),
          ),
          Row(
            children: [
              Image.asset(
                AppIcons.coinIcon,
                width: 22,
                height: 22,
              ),
              const SizedBox(width: 6),
              Text(
                "$coins Coins",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.lightTextPrimary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
