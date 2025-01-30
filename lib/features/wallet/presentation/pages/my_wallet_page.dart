import 'package:flutter/material.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';
import 'package:homeegram/core/constants/icons.dart';
import 'package:homeegram/core/navigation/navigation_extensions.dart';
import 'package:homeegram/features/wallet/presentation/widgets/back_button.dart';
import 'package:homeegram/features/wallet/presentation/widgets/coin_balance.dart';
import 'package:homeegram/features/wallet/presentation/widgets/wallet_action_button.dart';
import 'package:homeegram/features/wallet/presentation/widgets/wallet_app_bar.dart';

class MyWalletPage extends StatelessWidget {
  const MyWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              _buildAppBar(),
              _buildVerticalSpacer(context, 0.1),
              _buildActionButtonsList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return WalletAppBar(
      title: "My Wallet",
      actionButton: CoinBalance("1000"),
    );
  }

  Widget _buildActionButtonsList(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          WalletActionButton(
            label: "Upgrade Wallet",
            onTap: () => context.pushUpgradeWalletPage(),
          ),
          WalletActionButton(
            label: "Gift Coin",
            onTap: () => context.pushGiftCoinPage(),
          ),
          WalletActionButton(
            label: "Wallet History",
            onTap: () => context.pushWalletHistory(),
          ),
          WalletActionButton(
            label: "Refferal History",
            onTap: () => context.pushRefferalHistory(),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalSpacer(BuildContext context, double percentage) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * percentage,
    );
  }
}
