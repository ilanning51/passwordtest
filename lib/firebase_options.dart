// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyApkOtzFsEd-G7hAZrfN82fho7jna8jK5c',
    appId: '1:1052510852147:web:3f72b5333671c0f519bf46',
    messagingSenderId: '1052510852147',
    projectId: 'passwordtest-f84c0',
    authDomain: 'passwordtest-f84c0.firebaseapp.com',
    storageBucket: 'passwordtest-f84c0.appspot.com',
    measurementId: 'G-ZNWGQKVPBJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgoP_rm_PiqvgRS9o-yWjvfK5jIEJ9s6Y',
    appId: '1:1052510852147:android:80c20a4c3bb53cb019bf46',
    messagingSenderId: '1052510852147',
    projectId: 'passwordtest-f84c0',
    storageBucket: 'passwordtest-f84c0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBUBjc93iRovDIQvJUX7P2RnCoLsktwbB0',
    appId: '1:1052510852147:ios:ecaca0df11fd657e19bf46',
    messagingSenderId: '1052510852147',
    projectId: 'passwordtest-f84c0',
    storageBucket: 'passwordtest-f84c0.appspot.com',
    iosBundleId: 'com.example.passwordtest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBUBjc93iRovDIQvJUX7P2RnCoLsktwbB0',
    appId: '1:1052510852147:ios:ecaca0df11fd657e19bf46',
    messagingSenderId: '1052510852147',
    projectId: 'passwordtest-f84c0',
    storageBucket: 'passwordtest-f84c0.appspot.com',
    iosBundleId: 'com.example.passwordtest',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyApkOtzFsEd-G7hAZrfN82fho7jna8jK5c',
    appId: '1:1052510852147:web:d345eb128936ff0a19bf46',
    messagingSenderId: '1052510852147',
    projectId: 'passwordtest-f84c0',
    authDomain: 'passwordtest-f84c0.firebaseapp.com',
    storageBucket: 'passwordtest-f84c0.appspot.com',
    measurementId: 'G-CG47WH598D',
  );

}