import 'package:flutter/material.dart';
import 'package:users/authentication/login_auth.dart';
import 'package:users/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyD8AYv4rrR85WPWpRm3ycL9nuwEz7Nwxww",
      appId: "1:664961988788:web:27209c40089d9b708a3fe1",
      messagingSenderId: "664961988788",
      projectId: "new-app-f0479",
    ),
  );
  runApp(((MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: LoginAuth());
  }
}
