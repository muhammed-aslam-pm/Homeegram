import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homeegram/core/router/scaffold_with_nav.dart';
import 'package:homeegram/features/auth/presentation/pages/category_choose_page.dart';
import 'package:homeegram/features/auth/presentation/pages/interest_selection_page.dart';
import 'package:homeegram/features/auth/presentation/pages/login_page.dart';
import 'package:homeegram/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:homeegram/features/auth/presentation/pages/professionl_category_choose_page.dart';
import 'package:homeegram/features/auth/presentation/pages/profile_information_page.dart';
import 'package:homeegram/features/auth/presentation/pages/sign_up_page.dart';
import 'package:homeegram/features/home/home_page.dart';
import 'package:homeegram/features/wallet/presentation/pages/my_wallet_page.dart';
import 'package:homeegram/features/wallet/presentation/pages/wallet_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login',
    debugLogDiagnostics: true,
    redirect: (context, state) async {
      final isLoggedIn = false; // Replace with your actual authentication logic
      final location = state.uri.toString();

      // Define public routes
      final publicRoutes = [
        '/login',
        '/otp_verification',
        '/signup',
        '/choose_category',
        '/intersets_selection',
        '/professional_category_choose',
        '/profile_information_form',
        '/my_wallet',
      ];

      // Handle unauthenticated users
      if (!isLoggedIn && !publicRoutes.contains(location)) {
        debugPrint('Redirecting to /login...');
        return '/login';
      }

      // Prevent authenticated users from accessing auth pages
      if (isLoggedIn &&
          ['/login', '/otp_verification', '/signup'].contains(location)) {
        debugPrint('Redirecting to home...');
        return '/';
      }

      debugPrint('No redirection.');
      return null; // No redirection
    },
    routes: [
      // Login Page
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const WalletPage(),
      ),
      // OTP Verification Page
      GoRoute(
        path: '/otp_verification',
        name: 'otp_verification',
        builder: (context, state) {
          final phoneNumber =
              state.extra as String; // Retrieve the phone number
          return OtpVerificationPage(phoneNumber: phoneNumber);
        },
      ),
      // SignUp Page
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => const SignUpPage(),
      ),
      // Category Choose Page
      GoRoute(
        path: '/choose_category',
        name: 'choose_category',
        builder: (context, state) => const CategoryChoosePage(),
      ),
      // Interests Selection Page
      GoRoute(
        path: '/intersets_selection',
        name: 'intersets_selection',
        builder: (context, state) => const InterestSelectionPage(),
      ),
      // Professional Category Choose Page
      GoRoute(
        path: '/professional_category_choose',
        name: 'professional_category_choose',
        builder: (context, state) => const ProfessionalCategoryChoosePage(),
      ),
      // Profile Information Form Page
      GoRoute(
        path: '/profile_information_form',
        name: 'profile_information_form',
        builder: (context, state) => ProfileInformationFormPage(),
      ),
      // My Wallet Page
      GoRoute(
        path: '/my_wallet',
        name: 'my_wallet',
        builder: (context, state) => const MyWalletPage(),
      ),
      // Main App Shell with Bottom Navigation
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithBottomNav(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const HomePage(),
          ),
        ],
      ),
    ],
  );
}
  // Login Page
      // GoRoute(
      //   path: '/login',
      //   name: 'login',
      //   builder: (context, state) => const LoginPage(),
      // ),