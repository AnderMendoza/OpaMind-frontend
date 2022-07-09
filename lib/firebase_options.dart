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
    apiKey: 'AIzaSyCmEDeDLKqkAxXIox5SunUBDRcd1Ht9Jpc',
    appId: '1:497043800823:web:1e7a4974908da6030e49f2',
    messagingSenderId: '497043800823',
    projectId: 'opamind-15104',
    authDomain: 'opamind-15104.firebaseapp.com',
    storageBucket: 'opamind-15104.appspot.com',
    measurementId: 'G-F6KTGHSNKF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHAGjarRcQzVQ5b5HjZkNDy_IQ2vQIw8M',
    appId: '1:497043800823:android:c97a0af071cbb0e50e49f2',
    messagingSenderId: '497043800823',
    projectId: 'opamind-15104',
    storageBucket: 'opamind-15104.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCzF465OpdK8Z02nzt_EWHL1AkTEgc5_v4',
    appId: '1:497043800823:ios:e28d2d2d3e872b310e49f2',
    messagingSenderId: '497043800823',
    projectId: 'opamind-15104',
    storageBucket: 'opamind-15104.appspot.com',
    androidClientId:
        '497043800823-24ub1d6kdsrgnc0os983rhpshni0csoc.apps.googleusercontent.com',
    iosClientId:
        '497043800823-qg6vmfafte941e5610c8n1plgh4vigiv.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );
}