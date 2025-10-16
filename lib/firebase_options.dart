import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyArf87H82RRYponnqIJz6QFlGtm4EoO6Es',
    appId: '1:459899542795:android:d143e075c22b25868e960e',
    messagingSenderId: '459899542795',
    projectId: 'prontuario-eletronico-bc08c',
    storageBucket: 'prontuario-b0e08.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArf87H82RRYponnqIJz6QFlGtm4EoO6Es',
    appId: '1:459899542795:android:d143e075c22b25868e960e',
    messagingSenderId: '459899542795',
    projectId: 'prontuario-eletronico-bc08c',
    storageBucket: 'prontuario-b0e08.firebasestorage.app',
    iosBundleId: 'com.example.prontuarioEletronico',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyArf87H82RRYponnqIJz6QFlGtm4EoO6Es',
    appId: '1:459899542795:android:d143e075c22b25868e960e',
    messagingSenderId: '459899542795',
    projectId: 'prontuario-eletronico-bc08c',
    storageBucket: 'prontuario-b0e08.firebasestorage.app',
    authDomain: 'prontuario-b0e08.firebaseapp.com',
  );
}
