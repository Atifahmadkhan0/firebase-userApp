import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:users/authentication/auth_page.dart';
import 'package:users/screens/home_screen.dart';

import '../pages/home_page.dart';

class LoginAuth extends StatefulWidget {
  LoginAuth({
    super.key,
  });

  @override
  State<LoginAuth> createState() => _LoginAuthState();
}

class _LoginAuthState extends State<LoginAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage(
                email: '',
                name: '',
              );
            } else {
              return AuthPage();
            }
          }),
    );
  }
}
