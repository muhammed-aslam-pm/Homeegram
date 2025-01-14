import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homeegram/core/router/scaffold_with_nav.dart';
import 'package:homeegram/features/auth/presentation/pages/category_choose_page.dart';
import 'package:homeegram/features/home/home_page.dart';
import 'package:homeegram/features/auth/presentation/pages/interest_selection_page.dart';
import 'package:homeegram/features/auth/presentation/pages/login_page.dart';
import 'package:homeegram/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:homeegram/features/auth/presentation/pages/professionl_category_choose_page.dart';
import 'package:homeegram/features/auth/presentation/pages/profile_information_page.dart';
import 'package:homeegram/features/auth/presentation/pages/sign_up_page.dart';

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
      if (!isLoggedIn) {
        // If user is not logged in, and they are not on the login, OTP, or sign up page, redirect them to login.
        if (state.uri.toString() != '/login' &&
            state.uri.toString() != '/otp_verification' &&
            state.uri.toString() != '/choose_category' &&
            state.uri.toString() != '/intersets_selection' &&
            state.uri.toString() != '/professional_category_choose' &&
            state.uri.toString() != '/profile_information_form' &&
            state.uri.toString() != '/signup') {
          return '/login';
        }
      } else {
        // If user is logged in, do not allow them to visit login, otp_verification, or signup
        if (state.uri.toString() == '/login' ||
            state.uri.toString() == '/otp_verification' ||
            state.uri.toString() == '/signup') {
          return '/';
        }
      }
      return null;
    },
    routes: [
      // Login Page
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      // OTP Verification Page
      GoRoute(
        path: '/otp_verification',
        name: 'otp_verification',
        builder: (context, state) => const OtpVerificationPage(),
      ),
      // SignUp Page
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => const SignUpPage(),
      ),
      // Category choose page
      GoRoute(
        path: '/choose_category',
        name: 'choose_category',
        builder: (context, state) => const CategoryChoosePage(),
      ),
      // interests selection Page
      GoRoute(
        path: '/intersets_selection',
        name: 'intersets_selection',
        builder: (context, state) => const InterestSelectionPage(),
      ),
      // proffesional categories choose Page
      GoRoute(
        path: '/professional_category_choose',
        name: 'professional_category_choose',
        builder: (context, state) => const ProfessionalCategoryChoosePage(),
      ),
      // proffesional categories choose Page
      GoRoute(
        path: '/profile_information_form',
        name: 'profile_information_form',
        builder: (context, state) => ProfileInformationFormPage(),
      ),
      // Additional steps after sign up
      // GoRoute(
      //   path: '/complete_signup', // New page for further signup steps
      //   name: 'complete_signup',
      //   builder: (context, state) => const CompleteSignUpPage(),
      // ),
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
