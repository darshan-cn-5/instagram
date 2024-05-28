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
    apiKey: 'AIzaSyC03hs_cvvCqvNcVWeHPwlBfBu1COl9E_8',
    appId: '1:331788082399:web:68389471a2cc17c95a9d6a',
    messagingSenderId: '331788082399',
    projectId: 'instagram-clone1-d2a6d',
    authDomain: 'instagram-clone1-d2a6d.firebaseapp.com',
    storageBucket: 'instagram-clone1-d2a6d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJm6Yabd3n-JH9pGrYZ4XGYGa1ymeyvuU',
    appId: '1:331788082399:android:056bd6a32c699a925a9d6a',
    messagingSenderId: '331788082399',
    projectId: 'instagram-clone1-d2a6d',
    storageBucket: 'instagram-clone1-d2a6d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9p8YKlvspuBUC0zRCIUgTlLmD3WKq3yc',
    appId: '1:331788082399:ios:f54975cb3b38f7025a9d6a',
    messagingSenderId: '331788082399',
    projectId: 'instagram-clone1-d2a6d',
    storageBucket: 'instagram-clone1-d2a6d.appspot.com',
    iosBundleId: 'com.example.instagram1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD9p8YKlvspuBUC0zRCIUgTlLmD3WKq3yc',
    appId: '1:331788082399:ios:f54975cb3b38f7025a9d6a',
    messagingSenderId: '331788082399',
    projectId: 'instagram-clone1-d2a6d',
    storageBucket: 'instagram-clone1-d2a6d.appspot.com',
    iosBundleId: 'com.example.instagram1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC03hs_cvvCqvNcVWeHPwlBfBu1COl9E_8',
    appId: '1:331788082399:web:68389471a2cc17c95a9d6a',
    messagingSenderId: '331788082399',
    projectId: 'instagram-clone1-d2a6d',
    authDomain: 'instagram-clone1-d2a6d.firebaseapp.com',
    storageBucket: 'instagram-clone1-d2a6d.appspot.com',
  );

}