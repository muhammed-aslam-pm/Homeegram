import 'package:flutter/material.dart';
import 'package:homeegram/features/wallet/presentation/widgets/back_button.dart';

class WalletAppBar extends StatelessWidget {
  final String title;
  final Widget? actionButton;
  const WalletAppBar({
    super.key,
    required this.title,
    this.actionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WalletBackButton(),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
        ),
        Spacer(),
        actionButton ?? SizedBox.shrink()
      ],
    );
  }
}
