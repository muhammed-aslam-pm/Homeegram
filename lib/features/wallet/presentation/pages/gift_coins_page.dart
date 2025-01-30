import 'package:flutter/material.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';
import 'package:homeegram/core/constants/icons.dart';
import 'package:homeegram/core/navigation/navigation_extensions.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_button.dart';
import 'package:homeegram/features/auth/presentation/widgets/text_form_field2.dart';
import 'package:homeegram/features/wallet/presentation/widgets/coin_balance.dart';
import 'package:homeegram/features/wallet/presentation/widgets/wallet_app_bar.dart';

class GiftCoinPage extends StatelessWidget {
  const GiftCoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WalletAppBar(
                title: "Gift Coin",
                actionButton: CoinBalance("1000"),
              ),
              _buildVerticalSpacer(screenSize.height, 0.1),
              _buildAmountInput(),
              _buildVerticalSpacer(screenSize.height, 0.02),
              _buildHomeeIdInput(),
              _buildVerticalSpacer(screenSize.height, 0.04),
              Spacer(),
              _buildVerifyButton(context, screenSize.height),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  CustomTextField2 _buildHomeeIdInput() {
    return const CustomTextField2(
      hint: "Homeera ID :",
      prefixIcon: Icon(
        Icons.person_2_rounded,
        size: 20,
      ),
      suffixIcon: Icon(
        Icons.check_circle,
        color: AppColors.success,
      ),
    );
  }

  Widget _buildVerifyButton(BuildContext context, double screenHeight) {
    return LoginButton(
      text: "Verify",
      onPressed: () => _handleVerify(context),
      height: screenHeight * 0.06,
    );
  }

  Widget _buildVerticalSpacer(double screenHeight, double percentage) {
    return SizedBox(height: screenHeight * percentage);
  }

  Widget _buildAmountInput() {
    return CustomTextField2(
      hint: "Coins",
      prefixIcon: SizedBox(
        width: 50,
        child: Center(
          child: Image.asset(
            AppIcons.coinIcon,
            height: 30,
            width: 30,
          ),
        ),
      ),
    );
  }

  _handleVerify(BuildContext context) {
    context.walletVerificationPage();
  }
}
