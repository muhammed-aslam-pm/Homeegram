import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homeegram/core/router/scaffold_with_nav.dart';
import 'package:homeegram/features/auth/presentation/pages/home_page.dart';
import 'package:homeegram/features/auth/presentation/pages/login_page.dart';

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
      // Example authentication check
      final isLoggedIn = false; // Replace with your auth check
      final isGoingToLogin = state.matchedLocation == '/login';

      if (!isLoggedIn && !isGoingToLogin) {
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
      ),
      // GoRoute(
      //   path: '/register',
      //   name: 'register',
      //   builder: (context, state) => const RegisterPage(),
      // ),

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
          // // Home Routes
          // GoRoute(
          //   path: '/',
          //   name: 'home',
          //   builder: (context, state) => const HomePage(),
          //   routes: [
          //     GoRoute(
          //       path: 'post/:postId',
          //       name: 'post-details',
          //       builder: (context, state) {
          //         final postId = state.pathParameters['postId']!;
          //         return PostDetailsPage(postId: postId);
          //       },
          //     ),
          //   ],
          // ),

          // // Profile Routes
          // GoRoute(
          //   path: '/profile',
          //   name: 'profile',
          //   builder: (context, state) => const ProfilePage(),
          //   routes: [
          //     GoRoute(
          //       path: 'edit',
          //       name: 'edit-profile',
          //       parentNavigatorKey: _rootNavigatorKey, // Opens in full screen
          //       builder: (context, state) => const EditProfilePage(),
          //     ),
          //   ],
          // ),

          // // Chat Routes
          // GoRoute(
          //   path: '/chat',
          //   name: 'chat-list',
          //   builder: (context, state) => const ChatListPage(),
          //   routes: [
          //     GoRoute(
          //       path: ':chatId',
          //       name: 'chat-details',
          //       builder: (context, state) {
          //         final chatId = state.pathParameters['chatId']!;
          //         return ChatDetailsPage(chatId: chatId);
          //       },
          //     ),
          //   ],
          // ),
        ],
      ),
    ],
    // errorBuilder: (context, state) => ErrorPage(error: state.error),
  );
}
