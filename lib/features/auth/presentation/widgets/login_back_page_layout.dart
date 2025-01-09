import 'package:flutter/material.dart';
import 'package:homeegram/core/theme/app_colors.dart';

class BasePageLayout extends StatelessWidget {
  final Widget topContent;
  final Widget bottomContent;
  final double topFlex;
  final double bottomFlex;
  final Color backgroundColor;
  final Color surfaceColor;

  const BasePageLayout({
    super.key,
    required this.topContent,
    required this.bottomContent,
    this.topFlex = 2,
    this.bottomFlex = 4,
    this.backgroundColor = AppColors.lightPrimary,
    this.surfaceColor = AppColors.lightSurface,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Expanded(
            flex: topFlex.toInt(),
            child: topContent,
          ),
          Expanded(
            flex: bottomFlex.toInt(),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: surfaceColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
              padding: const EdgeInsets.all(10),
              child: bottomContent,
            ),
          )
        ],
      ),
    );
  }
}
