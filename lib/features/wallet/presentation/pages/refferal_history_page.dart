import 'package:flutter/material.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';
import 'package:homeegram/features/wallet/presentation/widgets/filter_button.dart';
import 'package:homeegram/features/wallet/presentation/widgets/referal_card.dart';
import 'package:homeegram/features/wallet/presentation/widgets/wallet_app_bar.dart';

class RefferalHistoryPage extends StatelessWidget {
  const RefferalHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WalletAppBar(
                title: "Refferal History",
                actionButton: FilterButton(),
              ),
              _buildVerticalSpacer(screenSize.height, 0.04),
              _buildReferalsList(),
            ],
          ),
        ),
      ),
    );
  }

  _buildReferalsList() {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) => ReferralCard(
        referralId: "@ab*****",
        dateTime: "28|05|2024",
        coins: 50,
      ),
      itemCount: 5,
      separatorBuilder: (context, index) => SizedBox(
        height: 20,
      ),
    );
  }

  Widget _buildVerticalSpacer(double screenHeight, double percentage) {
    return SizedBox(height: screenHeight * percentage);
  }
}
