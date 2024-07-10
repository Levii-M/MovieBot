import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA0ssthPS69RcTw1mv3KUVee13HWI6BIrQ",
            authDomain: "movie-bot-ubqhol.firebaseapp.com",
            projectId: "movie-bot-ubqhol",
            storageBucket: "movie-bot-ubqhol.appspot.com",
            messagingSenderId: "83420419229",
            appId: "1:83420419229:web:9b6e00e254bf08569b7074"));
  } else {
    await Firebase.initializeApp();
  }
}
