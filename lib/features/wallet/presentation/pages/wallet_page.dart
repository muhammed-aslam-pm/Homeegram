import 'package:flutter/material.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';
import 'package:homeegram/core/constants/icons.dart';
import 'package:homeegram/core/constants/images.dart';
import 'package:homeegram/core/shared/widgets/app_logo_with_text.dart';
import 'package:homeegram/features/wallet/presentation/widgets/back_button.dart';
import 'package:homeegram/features/wallet/presentation/widgets/wallet_menu_item.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // final localization = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              _buildappBar(screenHeight),
              _buildMyWalletButton(screenHeight),
              ListView(
                shrinkWrap: true,
                children: const [
                  SizedBox(height: 16),
                  WalletMenuItem(
                    icon: Icons.account_balance_wallet_rounded,
                    title: 'Wallet Balance',
                  ),
                  WalletMenuItem(
                    icon: Icons.history_rounded,
                    title: 'Transaction History',
                  ),
                  WalletMenuItem(
                    icon: Icons.credit_card_rounded,
                    title: 'Payment Methods',
                  ),
                  WalletMenuItem(
                    icon: Icons.add_circle_outline_rounded,
                    title: 'Add Money',
                  ),
                  WalletMenuItem(
                    icon: Icons.currency_exchange_rounded,
                    title: 'Withdraw Funds',
                  ),
                  WalletMenuItem(
                    icon: Icons.star_border_rounded,
                    title: 'Rewards & Offers',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildMyWalletButton(double screenHeight) {
    return Container(
      height: screenHeight * 0.12,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.walletBg), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(23)),
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Column(
            children: [
              Text("My Wallet",
                  style: TextStyle(
                      color: AppColors.lightTextPrimary,
                      fontWeight: FontWeight.w600)),
              Row(
                children: [
                  Image.asset(
                    AppIcons.coinIcon,
                    height: 25,
                    width: 25,
                  ),
                  Text("10000",
                      style: TextStyle(
                          color: AppColors.lightTextPrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 20))
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Row _buildappBar(double screenHeight) {
    return Row(
      children: [
        WalletBackButton(),
        Expanded(
          child: AppLogoWithText(height: screenHeight * 0.07),
        )
      ],
    );
  }
}
