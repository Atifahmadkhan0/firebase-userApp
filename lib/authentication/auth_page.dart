import 'package:flutter/material.dart';
import 'package:users/pages/home_page.dart';
import 'package:users/screens/home_register_screen.dart';
import 'package:users/screens/home_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showHomeScreen = true;
  void toggleScreen() {
    setState(() {
      showHomeScreen = !showHomeScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showHomeScreen) {
      return HomeScreen(showHomeRegisterScreen: toggleScreen);
    } else {
      return HomeRegisterScreen(
        showHomeScreen: toggleScreen,
      );
    }
  }
}
