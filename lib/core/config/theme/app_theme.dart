import 'package:flutter/material.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimary,
      // onPrimary: AppColors.lightOnPrimary,
      // primaryContainer: AppColors.lightPrimaryContainer,
      // secondary: AppColors.lightSecondary,
      // background: AppColors.lightBackground,
      surface: AppColors.lightSurface,
      // error: AppColors.lightError,
      // onBackground: AppColors.lightOnBackground,
      // onSurface: AppColors.lightOnSurface,
    ),
    // // AppBar Theme
    // appBarTheme: const AppBarTheme(
    //   elevation: 0,
    //   centerTitle: true,
    //   // backgroundColor: AppColors.lightBackground,
    //   // foregroundColor: AppColors.lightOnBackground,
    //   // iconTheme: IconThemeData(color: AppColors.lightOnBackground),
    // ),
    // // Card Theme
    // cardTheme: CardTheme(
    //   elevation: 2,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(12),
    //   ),
    // ),
    // // Input Decoration Theme
    // inputDecorationTheme: InputDecorationTheme(
    //   filled: true,
    //   fillColor: AppColors.lightBackground,
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: BorderSide(color: AppColors.lightPrimary.withOpacity(0.3)),
    //   ),
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: BorderSide(color: AppColors.lightPrimary.withOpacity(0.3)),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: const BorderSide(color: AppColors.lightPrimary),
    //   ),
    //   errorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: const BorderSide(color: AppColors.lightError),
    //   ),
    //   contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    // ),
    // Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: AppColors.lightPrimary,
          foregroundColor: AppColors.lightTextPrimary,
          textStyle: TextStyle(
              color: AppColors.lightTextPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w600)),
    ),
  );

//   static ThemeData darkTheme = ThemeData(
//     useMaterial3: true,
//     brightness: Brightness.dark,
//     colorScheme: const ColorScheme.dark(
//       primary: AppColors.darkPrimary,
//       onPrimary: AppColors.darkOnPrimary,
//       primaryContainer: AppColors.darkPrimaryContainer,
//       secondary: AppColors.darkSecondary,
//       background: AppColors.darkBackground,
//       surface: AppColors.darkSurface,
//       error: AppColors.darkError,
//       onBackground: AppColors.darkOnBackground,
//       onSurface: AppColors.darkOnSurface,
//     ),
//     // AppBar Theme
//     appBarTheme: const AppBarTheme(
//       elevation: 0,
//       centerTitle: true,
//       backgroundColor: AppColors.darkBackground,
//       foregroundColor: AppColors.darkOnBackground,
//       iconTheme: IconThemeData(color: AppColors.darkOnBackground),
//     ),
//     // Card Theme
//     cardTheme: CardTheme(
//       elevation: 2,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//     ),
//     // Input Decoration Theme
//     inputDecorationTheme: InputDecorationTheme(
//       filled: true,
//       fillColor: AppColors.darkSurface,
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: BorderSide(color: AppColors.darkPrimary.withOpacity(0.3)),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: BorderSide(color: AppColors.darkPrimary.withOpacity(0.3)),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: AppColors.darkPrimary),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: AppColors.darkError),
//       ),
//       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//     ),
//     // Button Theme
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         elevation: 0,
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//     ),
//   );
}
