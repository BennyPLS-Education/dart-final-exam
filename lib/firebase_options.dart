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
    apiKey: 'AIzaSyC6UlrL3qqBkKkSo5EXTblbnRrntmbEoA0',
    appId: '1:933925288875:web:759ae7ee5af63b90f670ee',
    messagingSenderId: '933925288875',
    projectId: 'exam-9d06d',
    authDomain: 'exam-9d06d.firebaseapp.com',
    databaseURL: 'https://exam-9d06d-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'exam-9d06d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZsxtMAR_jDMUKR6X-yQE4BenSv3DcPWg',
    appId: '1:933925288875:android:68c870635e974399f670ee',
    messagingSenderId: '933925288875',
    projectId: 'exam-9d06d',
    databaseURL: 'https://exam-9d06d-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'exam-9d06d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-k_lTPWNrVMbPvFs3ZfLjcUXmWBtZMI4',
    appId: '1:933925288875:ios:1b7d59863bf254fef670ee',
    messagingSenderId: '933925288875',
    projectId: 'exam-9d06d',
    databaseURL: 'https://exam-9d06d-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'exam-9d06d.appspot.com',
    iosBundleId: 'com.example.examenFinalAguilo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD-k_lTPWNrVMbPvFs3ZfLjcUXmWBtZMI4',
    appId: '1:933925288875:ios:835777c3584a1c5bf670ee',
    messagingSenderId: '933925288875',
    projectId: 'exam-9d06d',
    databaseURL: 'https://exam-9d06d-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'exam-9d06d.appspot.com',
    iosBundleId: 'com.example.examenFinalAguilo.RunnerTests',
  );
}
