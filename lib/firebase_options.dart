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
    apiKey: 'AIzaSyBT6jaUTzGxmxU6NwQzMUC4hx41N4ShMXY',
    appId: '1:782470569424:web:5745082d78a65df4daedd5',
    messagingSenderId: '782470569424',
    projectId: 'ecommerce-66787',
    authDomain: 'ecommerce-66787.firebaseapp.com',
    storageBucket: 'ecommerce-66787.appspot.com',
    measurementId: 'G-2H0208YZ9K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkOKl1sFeRIi8ctRNvYkJAsI7f6_qPcbU',
    appId: '1:782470569424:android:877635194f1ad2f2daedd5',
    messagingSenderId: '782470569424',
    projectId: 'ecommerce-66787',
    storageBucket: 'ecommerce-66787.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANMsIH4oURcfMoRr3pzMF6rcUcNwIPsmg',
    appId: '1:782470569424:ios:b86f1b62e32b5b6fdaedd5',
    messagingSenderId: '782470569424',
    projectId: 'ecommerce-66787',
    storageBucket: 'ecommerce-66787.appspot.com',
    iosBundleId: 'com.example.eCommerceFlutter',
  );
}
