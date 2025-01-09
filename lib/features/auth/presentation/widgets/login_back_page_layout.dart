// import 'package:flutter/material.dart';
// import 'package:homeegram/core/theme/app_colors.dart';

// class BasePageLayout extends StatelessWidget {
//   final Widget topContent;
//   final Widget bottomContent;
//   final double topFlex;
//   final double bottomFlex;
//   final Color backgroundColor;
//   final Color surfaceColor;

//   const BasePageLayout({
//     super.key,
//     required this.topContent,
//     required this.bottomContent,
//     this.topFlex = 2,
//     this.bottomFlex = 4,
//     this.backgroundColor = AppColors.lightPrimary,
//     this.surfaceColor = AppColors.lightSurface,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       body: Column(
//         children: [
//           Expanded(
//             flex: topFlex.toInt(),
//             child: topContent,
//           ),
//           Expanded(
//             flex: bottomFlex.toInt(),
//             child: Container(
//               width: double.infinity,
//               height: double.infinity,
//               decoration: BoxDecoration(
//                 color: surfaceColor,
//                 borderRadius: const BorderRadius.vertical(
//                   top: Radius.circular(50),
//                 ),
//               ),
//               padding: const EdgeInsets.all(10),
//               child: bottomContent,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// lib/core/shared/widgets/base_page_scaffold.dart
import 'package:flutter/material.dart';
import 'package:homeegram/core/theme/app_colors.dart';

class BasePageScaffold extends StatelessWidget {
  final Widget topSection;
  final Widget bottomSection;
  final bool isScrollable;
  final Duration animationDuration;

  const BasePageScaffold({
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
      body: Column(
        children: [
          // Animated top section
          AnimatedContainer(
            duration: animationDuration,
            height: MediaQuery.of(context).size.height * 0.35,
            child: topSection,
          ),
          // Animated bottom section with curved border
          Expanded(
            child: AnimatedContainer(
              width: MediaQuery.of(context).size.width,
              duration: animationDuration,
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
          ),
        ],
      ),
    );
  }
}
