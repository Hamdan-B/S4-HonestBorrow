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
    apiKey: 'AIzaSyBHjPXgd3oWzHrADly4WczM-fn0i9PDNmQ',
    appId: '1:466815897366:web:d1498b8c71964e34d20a37',
    messagingSenderId: '466815897366',
    projectId: 'loanapp-fbeba',
    authDomain: 'loanapp-fbeba.firebaseapp.com',
    databaseURL: 'https://loanapp-fbeba-default-rtdb.firebaseio.com',
    storageBucket: 'loanapp-fbeba.appspot.com',
    measurementId: 'G-F2VVFM9KYQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfO3EkR3lrfeynwkypLC0zcuDTRVdZgZM',
    appId: '1:466815897366:android:5cebe7d7e9706a97d20a37',
    messagingSenderId: '466815897366',
    projectId: 'loanapp-fbeba',
    databaseURL: 'https://loanapp-fbeba-default-rtdb.firebaseio.com',
    storageBucket: 'loanapp-fbeba.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAFHr4d8kq4BrHsJ7h2eA3guFeSUsbdCsw',
    appId: '1:466815897366:ios:f99f90dd0072bd0cd20a37',
    messagingSenderId: '466815897366',
    projectId: 'loanapp-fbeba',
    databaseURL: 'https://loanapp-fbeba-default-rtdb.firebaseio.com',
    storageBucket: 'loanapp-fbeba.appspot.com',
    iosBundleId: 'com.example.loanApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAFHr4d8kq4BrHsJ7h2eA3guFeSUsbdCsw',
    appId: '1:466815897366:ios:df9e734bfa8ff091d20a37',
    messagingSenderId: '466815897366',
    projectId: 'loanapp-fbeba',
    databaseURL: 'https://loanapp-fbeba-default-rtdb.firebaseio.com',
    storageBucket: 'loanapp-fbeba.appspot.com',
    iosBundleId: 'com.example.loanApp.RunnerTests',
  );
}
