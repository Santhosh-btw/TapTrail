import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCnxm2HqwKys9_Z3wiqltPUcBmmYkCgbjM",
            authDomain: "taptrail-gamification.firebaseapp.com",
            projectId: "taptrail-gamification",
            storageBucket: "taptrail-gamification.appspot.com",
            messagingSenderId: "190502741228",
            appId: "1:190502741228:web:aafa9916b72ae4c1f031c9",
            measurementId: "G-K02DN3SMJJ"));
  } else {
    await Firebase.initializeApp();
  }
}
