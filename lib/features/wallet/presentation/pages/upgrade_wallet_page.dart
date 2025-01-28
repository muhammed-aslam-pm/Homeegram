import 'package:flutter/material.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';
import 'package:homeegram/core/constants/icons.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_button.dart';
import 'package:homeegram/features/auth/presentation/widgets/text_form_field2.dart';
import 'package:homeegram/features/wallet/presentation/widgets/wallet_app_bar.dart';

class UpgradeWalletPage extends StatelessWidget {
  const UpgradeWalletPage({super.key});

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
              const WalletAppBar(title: "Upgrade Wallet"),
              _buildVerticalSpacer(screenSize.height, 0.1),
              _buildAmountInput(),
              _buildVerticalSpacer(screenSize.height, 0.04),
              _buildUpgradeButton(context, screenSize.height),
              _buildVerticalSpacer(screenSize.height, 0.04),
              _buildCustomDivider(),
              _buildVerticalSpacer(screenSize.height, 0.04),
              _buildPaymentMethodsHeader(theme),
              _buildVerticalSpacer(screenSize.height, 0.02),
              _buildPaymentMethodIcons(),
              _buildVerticalSpacer(screenSize.height, 0.02),
              _buildUpiIdInput(),
              const Spacer(),
              _buildSecurePaymentText(theme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerticalSpacer(double screenHeight, double percentage) {
    return SizedBox(height: screenHeight * percentage);
  }

  Widget _buildAmountInput() {
    return const CustomTextField2(
      hint: "Amount",
      prefixIcon: Icon(
        Icons.currency_rupee_rounded,
        size: 20,
      ),
    );
  }

  Widget _buildUpgradeButton(BuildContext context, double screenHeight) {
    return LoginButton(
      text: "Upgrade",
      onPressed: () => _handleUpgrade(context),
      height: screenHeight * 0.06,
    );
  }

  Widget _buildCustomDivider() {
    return Divider(
      color: AppColors.grey1.withValues(alpha: 0.7),
      thickness: 3,
    );
  }

  Widget _buildPaymentMethodsHeader(ThemeData theme) {
    return Text(
      "Payment Methods",
      style: theme.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildPaymentMethodIcons() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 20),
        _PaymentIcon(imagePath: AppIcons.googlePayIcon),
        SizedBox(width: 10),
        _PaymentIcon(imagePath: AppIcons.phonepeIcon),
        SizedBox(width: 10),
        _PaymentIcon(imagePath: AppIcons.paytmIcon),
      ],
    );
  }

  Widget _buildUpiIdInput() {
    return const CustomTextField2(
      hint: "Enter UPI ID",
      suffixIcon: Icon(
        Icons.check_circle,
        color: AppColors.success,
      ),
    );
  }

  Widget _buildSecurePaymentText(ThemeData theme) {
    return Center(
      child: Text(
        "100% Secure Payment",
        style: theme.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  void _handleUpgrade(BuildContext context) {
    // TODO: Implement upgrade logic
  }
}

class _PaymentIcon extends StatelessWidget {
  final String imagePath;

  const _PaymentIcon({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      height: 35,
      width: 35,
      filterQuality: FilterQuality.high,
    );
  }
}
