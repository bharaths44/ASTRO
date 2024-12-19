import 'package:astro/auth/email_verify_screen.dart';
import 'package:astro/auth/login_screen.dart';
import 'package:astro/auth/edit_profile_page.dart';

import 'package:astro/auth/signup_page.dart';
import 'package:astro/home/home_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation:
      FirebaseAuth.instance.currentUser == null ? '/auth' : '/home',
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) =>
          FirebaseAuth.instance.currentUser == null ? '/auth' : '/home',
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/auth/email-verify',
      builder: (context, state) => EmailVerifyScreen(),
    ),
    GoRoute(
      path: '/auth/signup',
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: '/home/profile',
      builder: (context, state) => EditProfilePage(),
    ),
  ],
);
