import 'package:flutter/material.dart';
import 'package:homeegram/core/theme/app_colors.dart';

class BaseAuthPageScaffold extends StatelessWidget {
  final Widget topSection;
  final Widget bottomSection;
  final bool isScrollable;
  final Duration animationDuration;

  const BaseAuthPageScaffold({
    super.key,
    required this.topSection,
    required this.bottomSection,
    this.isScrollable = false,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPrimary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Animated top section
            AnimatedContainer(
              duration: animationDuration,
              height: MediaQuery.of(context).size.height * 0.35,
              child: topSection,
            ),
            // Animated bottom section with curved border
            AnimatedContainer(
              width: MediaQuery.of(context).size.width,
              duration: animationDuration,
              height: MediaQuery.of(context).size.height * 0.65,
              decoration: BoxDecoration(
                color: AppColors.lightSurface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
                child: isScrollable
                    ? SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: bottomSection,
                      )
                    : bottomSection,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
