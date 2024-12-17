// ignore_for_file: unused_local_variable

import 'package:astro/auth/login/bloc/login_bloc.dart';
import 'package:astro/auth/signup/bloc/signup_bloc.dart';
import 'package:astro/core/theme/text_theme.dart';
import 'package:astro/core/theme/theme.dart';
import 'package:astro/data_upload/bloc/file_upload_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:astro/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme =
        createTextTheme(context, "Montserrat", "Josefin Sans");

    MaterialTheme theme = MaterialTheme(textTheme);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(FirebaseAuth.instance),
        ),
        BlocProvider(
          create: (context) => FileUploadBloc(),
        ),
        BlocProvider(
          create: (context) =>
              SignupBloc(FirebaseAuth.instance, FirebaseFirestore.instance),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme.light(),
        // theme: brightness == Brightness.light ? theme.light() : theme.dark(),
        routerConfig: appRouter,
      ),
    );
  }
}
