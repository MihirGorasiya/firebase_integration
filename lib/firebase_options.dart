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
    apiKey: 'AIzaSyCpOqPNWCAGDeHHRm3tbOE3diPe7nJxE98',
    appId: '1:368402276816:web:8519675ab71d7bae1719d5',
    messagingSenderId: '368402276816',
    projectId: 'flutter-integration-e823d',
    authDomain: 'flutter-integration-e823d.firebaseapp.com',
    storageBucket: 'flutter-integration-e823d.appspot.com',
    measurementId: 'G-QQJ10GQNEK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBR10TagM9DLhTyroTqFCeBtlg-_uPWowc',
    appId: '1:368402276816:android:d2401b91a203aa5a1719d5',
    messagingSenderId: '368402276816',
    projectId: 'flutter-integration-e823d',
    storageBucket: 'flutter-integration-e823d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA8IHTniHFXOF03NPyCI0IFMzi1CnFBU48',
    appId: '1:368402276816:ios:6d0cba134cebee941719d5',
    messagingSenderId: '368402276816',
    projectId: 'flutter-integration-e823d',
    storageBucket: 'flutter-integration-e823d.appspot.com',
    iosClientId: '368402276816-5j8i7m7pspu0m50oimcbmuucsaq4qrfs.apps.googleusercontent.com',
    iosBundleId: 'com.example.notificationIntegration',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA8IHTniHFXOF03NPyCI0IFMzi1CnFBU48',
    appId: '1:368402276816:ios:6d0cba134cebee941719d5',
    messagingSenderId: '368402276816',
    projectId: 'flutter-integration-e823d',
    storageBucket: 'flutter-integration-e823d.appspot.com',
    iosClientId: '368402276816-5j8i7m7pspu0m50oimcbmuucsaq4qrfs.apps.googleusercontent.com',
    iosBundleId: 'com.example.notificationIntegration',
  );
}
