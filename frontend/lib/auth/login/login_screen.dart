import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providers = [EmailAuthProvider()];

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: SignInScreen(
        providers: providers,
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            context.go('/home');
          }),
          AuthStateChangeAction<UserCreated>((context, state) {
            context.go('/home');
          }),
          AuthStateChangeAction<CredentialLinked>((context, state) {
            context.go('/home');
          }),
          AuthStateChangeAction<AuthFailed>((context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Sign in failed: ${state.exception}')),
            );
          }),
        ],
      ),
    );
  }
}
