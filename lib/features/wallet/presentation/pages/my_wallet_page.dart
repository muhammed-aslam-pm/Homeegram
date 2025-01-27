import 'package:flutter/material.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';
import 'package:homeegram/core/constants/icons.dart';
import 'package:homeegram/features/wallet/presentation/widgets/back_button.dart';
import 'package:homeegram/features/wallet/presentation/widgets/wallet_action_button.dart';

class MyWalletPage extends StatelessWidget {
  const MyWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // final localization = AppLocalizations.of(context);
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            _buildappBar(screenHeight),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            _buildMenuActionButtons(),
          ],
        ),
      ),
    ));
  }

  Expanded _buildMenuActionButtons() {
    return Expanded(
      child: ListView(
        
        children: [
          WalletActionButton(label: "Upgrade Wallet"),
          WalletActionButton(label: "Gift Coin"),
          WalletActionButton(label: "Wallet History"),
          WalletActionButton(label: "Refferal History"),
        
        ],
      ),
    );
  }

  Row _buildappBar(double screenHeight) {
    return Row(
      children: [
        WalletBackButton(),
        Text(
          "My Wallet",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.grey2,
          ),
          padding: EdgeInsets.only(top: 3, bottom: 3, right: 10, left: 5),
          child: Row(
            children: [
              Image.asset(
                AppIcons.coinIcon,
                height: 25,
                width: 25,
              ),
              Text("1000",
                  style: TextStyle(
                      color: AppColors.lightTextPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: 16)),
            ],
          ),
        )
      ],
    );
  }
}

class WalletActionButton extends StatelessWidget {
  final String label;final void Function()? onTap;
  const WalletActionButton({
    super.key, required this.label, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: ListTile(
        leading: Icon(Icons.account_balance_wallet_rounded,
            color: AppColors.lightTextPrimary),
        title: Text(label),
        titleTextStyle: TextStyle(fontWeight: FontWeight.w600,color: AppColors.lightTextPrimary),
        trailing: Icon(Icons.chevron_right_rounded, color: AppColors.grey1),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        onTap:onTap ,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: AppColors.grey2)),
      ),
    );
  }
}
