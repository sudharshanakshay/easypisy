// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAvP-bM_o77kA3MJ4OQjgmOgiqvcM9u1Bs',
    appId: '1:369237157627:web:306d470407de1d2f42725e',
    messagingSenderId: '369237157627',
    projectId: 'easypisy',
    authDomain: 'easypisy.firebaseapp.com',
    storageBucket: 'easypisy.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCd_4seafdP8AXZRBwPePcuTleMBWS5FcY',
    appId: '1:369237157627:android:1d7c384ce122971b42725e',
    messagingSenderId: '369237157627',
    projectId: 'easypisy',
    storageBucket: 'easypisy.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8325V_EUX9Bw9UhLmZ3gYqrBT9atG2Zc',
    appId: '1:369237157627:ios:e94610ac97ae83db42725e',
    messagingSenderId: '369237157627',
    projectId: 'easypisy',
    storageBucket: 'easypisy.appspot.com',
    iosClientId: '369237157627-l91n6is65bhq1s9gd2fq31m54tpksg5p.apps.googleusercontent.com',
    iosBundleId: 'com.example.easypisy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8325V_EUX9Bw9UhLmZ3gYqrBT9atG2Zc',
    appId: '1:369237157627:ios:37b941c00b24252a42725e',
    messagingSenderId: '369237157627',
    projectId: 'easypisy',
    storageBucket: 'easypisy.appspot.com',
    iosClientId: '369237157627-q1lfrnmsrnflt723mopirgb395phhbi0.apps.googleusercontent.com',
    iosBundleId: 'com.example.easypisy.RunnerTests',
  );
}