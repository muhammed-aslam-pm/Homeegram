import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homeegram/core/router/scaffold_with_nav.dart';
import 'package:homeegram/features/auth/presentation/pages/home_page.dart';
import 'package:homeegram/features/auth/presentation/pages/login_page.dart';
import 'package:homeegram/features/auth/presentation/pages/otp_verification_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) async {
      final isLoggedIn = false; // Replace with your auth check
      final isGoingToLogin = state.matchedLocation == '/login';
      final isGoingToOtp =
          state.matchedLocation == '/otp_verification'; // Add this

      // Allow both login and OTP verification pages when not logged in
      if (!isLoggedIn && !isGoingToLogin && !isGoingToOtp) {
        return '/login';
      }
      if (isLoggedIn && isGoingToLogin) {
        return '/';
      }
      return null;
    },
    routes: [
      // Auth Routes
      GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => const LoginPage(),
          routes: [
          
        ]
      ),
      GoRoute(
        path: '/otp_verification',
        name: 'otp_verification', // Fix the name
        builder: (context, state) => const OtpVerificationPage(),
      ),

      // Main App Shell
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithBottomNav(child: child);
        },
        routes: [
          // Home Route
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const HomePage(),
          ),
        ],
      ),
    ],
    // errorBuilder: (context, state) => ErrorPage(error: state.error),
  );
}
