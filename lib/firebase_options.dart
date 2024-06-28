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
    apiKey: 'AIzaSyDisjabBHkmJ7kLTb6TSmy6djx111tNhc0',
    appId: '1:790181980189:web:5dc2d0c83c2b70f6aa7ef4',
    messagingSenderId: '790181980189',
    projectId: 'live-course-3068b',
    authDomain: 'live-course-3068b.firebaseapp.com',
    storageBucket: 'live-course-3068b.appspot.com',
    measurementId: 'G-C5KFM4QLGD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDiYlUOsN4bDqQLinI2spi5AiPmsWB9tC8',
    appId: '1:790181980189:android:460bb480a5e47d01aa7ef4',
    messagingSenderId: '790181980189',
    projectId: 'live-course-3068b',
    storageBucket: 'live-course-3068b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAOrNFUaToqAi79Lw-HAvxQQBTiiiP2H68',
    appId: '1:790181980189:ios:ded60115dabf4793aa7ef4',
    messagingSenderId: '790181980189',
    projectId: 'live-course-3068b',
    storageBucket: 'live-course-3068b.appspot.com',
    iosBundleId: 'com.example.graduationProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAOrNFUaToqAi79Lw-HAvxQQBTiiiP2H68',
    appId: '1:790181980189:ios:ded60115dabf4793aa7ef4',
    messagingSenderId: '790181980189',
    projectId: 'live-course-3068b',
    storageBucket: 'live-course-3068b.appspot.com',
    iosBundleId: 'com.example.graduationProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDisjabBHkmJ7kLTb6TSmy6djx111tNhc0',
    appId: '1:790181980189:web:df4ed83bfd76b0b2aa7ef4',
    messagingSenderId: '790181980189',
    projectId: 'live-course-3068b',
    authDomain: 'live-course-3068b.firebaseapp.com',
    storageBucket: 'live-course-3068b.appspot.com',
    measurementId: 'G-S2K1N9V12S',
  );
}
