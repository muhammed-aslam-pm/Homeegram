import 'package:flutter/material.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';
import 'package:homeegram/core/constants/icons.dart';
import 'package:homeegram/core/constants/images.dart';
import 'package:homeegram/core/navigation/navigation_extensions.dart';
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
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              _buildappBar(screenHeight),
              SizedBox(height: screenHeight * 0.03),
              _buildMyWalletButton(screenHeight, context),
              SizedBox(height: screenHeight * 0.03),
              _buildActionButtons(),
              Spacer(),
              _buildInviteButton(),
              Spacer(),
              _buildEndTitle(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Text _buildEndTitle() {
    return Text(
      "Made with Dream 💛",
      style: TextStyle(color: AppColors.grey1),
    );
  }

  Container _buildInviteButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey2, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.qr_code_2_rounded,
            color: AppColors.grey2,
            size: 18,
          ),
          SizedBox(width: 5),
          Text("Invite Friends")
        ],
      ),
    );
  }

  ListView _buildActionButtons() {
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: const [
        SizedBox(height: 16),
        WalletMenuItem(
          icon: Icons.person,
          title: 'My Profile',
        ),
        WalletMenuItem(
          icon: Icons.notifications_active,
          title: 'Subscription',
        ),
        WalletMenuItem(
          icon: Icons.collections_bookmark,
          title: 'Collections',
        ),
        WalletMenuItem(
          icon: Icons.campaign_rounded,
          title: 'Growth',
        ),
        WalletMenuItem(
          icon: Icons.toggle_on_outlined,
          title: 'Settings',
        ),
        WalletMenuItem(
          icon: Icons.featured_play_list,
          title: 'Suggestion & feedbacks',
        ),
        WalletMenuItem(
          icon: Icons.logout_rounded,
          title: 'Logout',
        ),
      ],
    );
  }

  _buildMyWalletButton(double screenHeight, BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushMyWalletPage();
      },
      child: Container(
        height: screenHeight * 0.12,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.walletBg), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(23)),
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("My Wallet",
                    style: TextStyle(
                        color: AppColors.lightTextPrimary,
                        fontWeight: FontWeight.w600)),
                Row(children: [
                  Image.asset(
                    AppIcons.coinIcon,
                    height: 25,
                    width: 25,
                  ),
                  Text("10000",
                      style: TextStyle(
                          color: AppColors.lightTextPrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 20)),
                ])
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.lightSurface),
              padding: EdgeInsets.all(5),
              height: 30,
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.lightTextPrimary,
                size: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildappBar(double screenHeight) {
    return Row(
      children: [
        WalletBackButton(),
        Expanded(
          child: AppLogoWithText(height: screenHeight * 0.085),
        )
      ],
    );
  }
}
