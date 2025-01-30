import 'package:flutter/material.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';
import 'package:homeegram/features/wallet/presentation/widgets/filter_button.dart';
import 'package:homeegram/features/wallet/presentation/widgets/referal_card.dart';
import 'package:homeegram/features/wallet/presentation/widgets/wallet_app_bar.dart';
import 'package:homeegram/features/wallet/presentation/widgets/wallet_history_card.dart';

class WalletHistoryPage extends StatelessWidget {
  const WalletHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WalletAppBar(
                  title: "Wallet History",
                  actionButton: FilterButton(),
                ),
                _buildVerticalSpacer(screenSize.height, 0.04),
                _buildTabBar(),
                _buildVerticalSpacer(screenSize.height, 0.04),
                _buildTabView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildTabBar() {
    return Stack(
      children: [
        Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(width: 2, color: AppColors.grey3)),
            child: SizedBox(
              width: double.infinity,
            )),
        SizedBox(
          height: 40,
          child: TabBar(
            tabs: [
              Tab(text: "Upgrade History"),
              Tab(text: "Gift Coin"),
            ],
            dividerColor: Colors.transparent,
            dividerHeight: 0,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.lightPrimary,
            ),
            indicatorColor: AppColors.lightPrimary,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: TextStyle(
                color: AppColors.lightTextPrimary, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }

  Widget _buildVerticalSpacer(double screenHeight, double percentage) {
    return SizedBox(height: screenHeight * percentage);
  }

  _buildTabView() {
    return Expanded(
      child: TabBarView(children: [
        _buildUpgradeHistory(),
        _buildCoinHistory(),
      ]),
    );
  }

  _buildUpgradeHistory() {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) => WalletHistoryCard(
        transactionId: "1234567",
        dateTime: "28|05|2024 |8.30 AM",
        coins: 500,
      ),
      itemCount: 5,
      separatorBuilder: (context, index) => SizedBox(
        height: 20,
      ),
    );
  }

  _buildCoinHistory() {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) => WalletHistoryCard(
        transactionId: "1234567",
        dateTime: "28|05|2024 |8.30 AM",
        coins: 500,
        userId: "@aslammhd",
        isSuccess: index % 2 == 0 ? true : false,
      ),
      itemCount: 5,
      separatorBuilder: (context, index) => SizedBox(
        height: 20,
      ),
    );
  }
}
