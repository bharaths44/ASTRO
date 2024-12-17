import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileScreen(
        actions: [
          SignedOutAction((context) {
            context.go('/auth');
          }),
        ],
      ),
    );
  }
}
