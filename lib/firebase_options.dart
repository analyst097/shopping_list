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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAOTQnWMZVAXCx73qWJ7uHLcy2P59t1d-U',
    appId: '1:254061296381:web:b5a06e52245c3227d71c94',
    messagingSenderId: '254061296381',
    projectId: 'shopping-list-5c39f',
    authDomain: 'shopping-list-5c39f.firebaseapp.com',
    storageBucket: 'shopping-list-5c39f.appspot.com',
    measurementId: 'G-0TDF6S9VDW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAWtpAd1KXHdgZPUOG-heFaQJ0e6Q3zGSE',
    appId: '1:254061296381:android:5cfbb7d5dd94c5e1d71c94',
    messagingSenderId: '254061296381',
    projectId: 'shopping-list-5c39f',
    storageBucket: 'shopping-list-5c39f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDSOwZYOm6zd5X_nx4PD6TKS5MXz_nmu_I',
    appId: '1:254061296381:ios:2cef5a6e0b1bc6acd71c94',
    messagingSenderId: '254061296381',
    projectId: 'shopping-list-5c39f',
    storageBucket: 'shopping-list-5c39f.appspot.com',
    iosBundleId: 'com.example.shoppingList',
  );
}
