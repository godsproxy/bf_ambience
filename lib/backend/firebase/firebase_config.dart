import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB77pm_pa58nxBfzWYWoaTenlqV7rnU9Bw",
            authDomain: "butterfly12.firebaseapp.com",
            projectId: "butterfly12",
            storageBucket: "butterfly12.appspot.com",
            messagingSenderId: "492641288786",
            appId: "1:492641288786:web:d1c638503b5f3f4fc3958b",
            measurementId: "G-FV0SFB6Z0P"));
  } else {
    await Firebase.initializeApp();
  }
}
