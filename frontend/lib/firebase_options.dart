// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:astro/core/config/firebase_keys.dart';
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static FirebaseOptions web = FirebaseOptions(
    apiKey: FirebaseEnv.webApiKey,
    appId: FirebaseEnv.webAppId,
    messagingSenderId: FirebaseEnv.webMessagingSenderId,
    projectId: FirebaseEnv.webProjectId,
    authDomain: FirebaseEnv.webAuthDomain,
    storageBucket: FirebaseEnv.webStorageBucket,
    measurementId: FirebaseEnv.webMeasurementId,
  );

  static FirebaseOptions android = FirebaseOptions(
    apiKey: FirebaseEnv.androidApiKey,
    appId: FirebaseEnv.androidAppId,
    messagingSenderId: FirebaseEnv.androidMessagingSenderId,
    projectId: FirebaseEnv.androidProjectId,
    storageBucket: FirebaseEnv.androidStorageBucket,
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: FirebaseEnv.iosApiKey,
    appId: FirebaseEnv.iosAppId,
    messagingSenderId: FirebaseEnv.iosMessagingSenderId,
    projectId: FirebaseEnv.iosProjectId,
    storageBucket: FirebaseEnv.iosStorageBucket,
    iosBundleId: FirebaseEnv.iosBundleId,
  );
}