import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension NavigationExtensions on BuildContext {
  void pushPostDetails(String postId) {
    goNamed('post-details', pathParameters: {'postId': postId});
  }

  void pushChatDetails(String chatId) {
    goNamed('chat-details', pathParameters: {'chatId': chatId});
  }

  void pushEditProfile() {
    goNamed('edit-profile');
  }

  void pushLogin() {
    goNamed('login');
  }

  void pushRegister() {
    goNamed('register');
  }
}
