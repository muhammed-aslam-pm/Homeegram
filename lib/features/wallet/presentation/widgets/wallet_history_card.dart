import 'package:flutter/material.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';
import 'package:homeegram/core/constants/icons.dart';

class WalletHistoryCard extends StatelessWidget {
  final String transactionId;
  final String dateTime;
  final int coins;
  final bool? isSuccess;
  final String? userId;

  const WalletHistoryCard({
    Key? key,
    required this.transactionId,
    required this.dateTime,
    required this.coins,
    this.isSuccess,
    this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 10, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.lightSurface,
        border: Border.all(color: AppColors.containerBorder, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Referal ID : $transactionId",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.lightTextPrimary,
                ),
              ),
              SizedBox(width: 10),
              if (isSuccess != null)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    isSuccess!
                        ? Icon(
                            Icons.check_circle,
                            size: 12,
                            color: AppColors.success,
                          )
                        : Icon(
                            Icons.remove_circle_outlined,
                            size: 12,
                            color: AppColors.error,
                          ),
                    SizedBox(width: 5),
                    Text(
                      isSuccess! ? "success" : "Failed",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.lightTextPrimary,
                      ),
                    ),
                  ],
                ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.grey3,
                ),
                padding: EdgeInsets.all(3),
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.lightSurface,
                  size: 12,
                ),
              ),
            ],
          ),
          Text(
            "Date & Time : $dateTime",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.lightTextPrimary,
            ),
          ),
          Row(
            children: [
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
              SizedBox(
                width: 20,
              ),
              if (userId != null)
                Row(
                  children: [
                    Icon(
                      (isSuccess ?? false)
                          ? Icons.arrow_circle_up
                          : Icons.arrow_circle_down,
                      color: (isSuccess ?? false)
                          ? AppColors.success
                          : AppColors.error,
                      size: 20,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      userId ?? "",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.lightTextPrimary),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
