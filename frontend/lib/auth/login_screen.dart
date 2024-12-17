import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providers = [EmailAuthProvider()];
    final logger = Logger();

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: SignInScreen(
        providers: providers,
        showPasswordVisibilityToggle: true,
        showAuthActionSwitch: true,
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            if (!state.user!.emailVerified) {
              logger.i('User is not verified');
              context.go('/auth/signup');
            } else {
              logger.i('User is verified');
              context.go('/auth/signup');
            }
          }),
          AuthStateChangeAction<UserCreated>((context, state) {
            logger.i('User is not verified');
            context.go('/auth/email-verify');
          }),
          AuthStateChangeAction<CredentialLinked>((context, state) {
            context.go('/home');
          }),
        ],
      ),
    );
  }
}
