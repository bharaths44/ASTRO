import 'package:astro/auth/login/login_screen.dart';
import 'package:astro/auth/signup/signup_screen.dart';
import 'package:astro/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation:
      FirebaseAuth.instance.currentUser == null ? '/auth/login' : '/home',
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) =>
          FirebaseAuth.instance.currentUser == null ? '/auth/login' : '/home',
    ),
    GoRoute(
      path: '/auth/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/auth/signup',
      builder: (context, state) => SignupScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
