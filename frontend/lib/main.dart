import 'package:astro/data_upload/bloc/file_upload_bloc.dart';
import 'package:astro/data_upload/data_upload.dart';
import 'package:astro/theme.dart';
import 'package:astro/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
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
    return MaterialApp(
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: BlocProvider(
        create: (context) => FileUploadBloc(),
        child: const FileUploadePage(),
      ),
    );
  }
}
