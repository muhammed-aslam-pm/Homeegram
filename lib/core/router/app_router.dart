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
      final isLoggedIn = false; // Replace with your actual auth check
      final routeName = state.name;

      if (!isLoggedIn) {
        // Allow access to auth-related routes
        if (routeName == 'login' ||
            routeName == 'otp_verification' ||
            routeName == 'signup' ||
            routeName == 'choose_category' ||
            routeName == 'intersets_selection' ||
            routeName == 'professional_category_choose' ||
            routeName == 'profile_information_form') {
          return null;
        }
        // Redirect to login for all other routes
        return '/login';
      } else {
        // Prevent logged-in users from accessing auth-related routes
        if (routeName == 'login' ||
            routeName == 'otp_verification' ||
            routeName == 'signup') {
          return '/';
        }
      }
      return null;
    },
    routes: [
      // Login Page
      // GoRoute(
      //   path: '/login',
      //   name: 'login',
      //   builder: (context, state) => const LoginPage(),
      // ),
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
