import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

class EmailVerifyScreen extends StatelessWidget {
  const EmailVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logger = Logger();
    return Scaffold(
      body: EmailVerificationScreen(
        headerBuilder: (context, constraints, _) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.verified, size: 100),
          );
        },
        actions: [
          EmailVerifiedAction(() {
            logger.i('User is verified');
            context.go('/auth/signup');
          }),
          AuthCancelledAction((context) {
            FirebaseUIAuth.signOut(context: context);
            context.go('/auth');
          }),
        ],
      ),
    );
  }
}
