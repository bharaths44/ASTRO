import 'package:envied/envied.dart';
part 'firebase_keys.g.dart';

@Envied(path: 'apikeys.env')
abstract class FirebaseEnv {
  // Web Configuration
  @EnviedField(varName: 'FIREBASE_WEB_API_KEY', obfuscate: true)
  static String webApiKey = _FirebaseEnv.webApiKey;

  @EnviedField(varName: 'FIREBASE_WEB_APP_ID', obfuscate: true)
  static String webAppId = _FirebaseEnv.webAppId;

  @EnviedField(varName: 'FIREBASE_WEB_MESSAGING_SENDER_ID', obfuscate: true)
  static String webMessagingSenderId = _FirebaseEnv.webMessagingSenderId;

  @EnviedField(varName: 'FIREBASE_WEB_PROJECT_ID', obfuscate: true)
  static String webProjectId = _FirebaseEnv.webProjectId;

  @EnviedField(varName: 'FIREBASE_WEB_AUTH_DOMAIN', obfuscate: true)
  static String webAuthDomain = _FirebaseEnv.webAuthDomain;

  @EnviedField(varName: 'FIREBASE_WEB_STORAGE_BUCKET', obfuscate: true)
  static String webStorageBucket = _FirebaseEnv.webStorageBucket;

  @EnviedField(varName: 'FIREBASE_WEB_MEASUREMENT_ID', obfuscate: true)
  static String webMeasurementId = _FirebaseEnv.webMeasurementId;

  // Android Configuration
  @EnviedField(varName: 'FIREBASE_ANDROID_API_KEY', obfuscate: true)
  static String androidApiKey = _FirebaseEnv.androidApiKey;

  @EnviedField(varName: 'FIREBASE_ANDROID_APP_ID', obfuscate: true)
  static String androidAppId = _FirebaseEnv.androidAppId;

  @EnviedField(varName: 'FIREBASE_ANDROID_MESSAGING_SENDER_ID', obfuscate: true)
  static String androidMessagingSenderId =
      _FirebaseEnv.androidMessagingSenderId;

  @EnviedField(varName: 'FIREBASE_ANDROID_PROJECT_ID', obfuscate: true)
  static String androidProjectId = _FirebaseEnv.androidProjectId;

  @EnviedField(varName: 'FIREBASE_ANDROID_STORAGE_BUCKET', obfuscate: true)
  static String androidStorageBucket = _FirebaseEnv.androidStorageBucket;

  // iOS Configuration
  @EnviedField(varName: 'FIREBASE_IOS_API_KEY', obfuscate: true)
  static String iosApiKey = _FirebaseEnv.iosApiKey;

  @EnviedField(varName: 'FIREBASE_IOS_APP_ID', obfuscate: true)
  static String iosAppId = _FirebaseEnv.iosAppId;

  @EnviedField(varName: 'FIREBASE_IOS_MESSAGING_SENDER_ID', obfuscate: true)
  static String iosMessagingSenderId = _FirebaseEnv.iosMessagingSenderId;

  @EnviedField(varName: 'FIREBASE_IOS_PROJECT_ID', obfuscate: true)
  static String iosProjectId = _FirebaseEnv.iosProjectId;

  @EnviedField(varName: 'FIREBASE_IOS_STORAGE_BUCKET', obfuscate: true)
  static String iosStorageBucket = _FirebaseEnv.iosStorageBucket;

  @EnviedField(varName: 'FIREBASE_IOS_BUNDLE_ID', obfuscate: true)
  static String iosBundleId = _FirebaseEnv.iosBundleId;
}
