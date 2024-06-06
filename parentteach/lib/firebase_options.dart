import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return FirebaseOptions(
      apiKey: 'your-api-key',
      authDomain: 'your-auth-domain',
      databaseURL: 'your-database-url',
      projectId: 'parentteach-b55ef',
      storageBucket: 'your-storage-bucket',
      messagingSenderId: '885509375872',
      appId: '1:885509375872:android:799b0b78cc61a3ad84e365',
    );
  }
}
