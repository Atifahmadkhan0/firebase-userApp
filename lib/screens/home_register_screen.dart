import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:users/screens/home_screen.dart';

class HomeRegisterScreen extends StatefulWidget {
  final VoidCallback showHomeScreen;
  const HomeRegisterScreen({super.key, required this.showHomeScreen});

  @override
  State<HomeRegisterScreen> createState() => _HomeRegisterScreenState();
}

class _HomeRegisterScreenState extends State<HomeRegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Login Account')),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Welcome To New App",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text(
              " Create Account",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 150,
            ),
            Center(
              child: Container(
                  height: 100,
                  width: 400,
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        hintText: "Enter Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  )),
            ),
            Center(
              child: Container(
                  height: 100,
                  width: 400,
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: "Enter Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  )),
            ),
            Center(
              child: Container(
                  height: 100,
                  width: 400,
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        hintText: "Enter password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  )),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You have account ?"),
                  TextButton(
                    onPressed: widget.showHomeScreen,
                    child: Text("Login"),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                height: 50,
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      _create();
                      signUp();
                    },
                    child: Text("Create ")))
          ],
        ),
      )),
    );
  }

  Future _create() async {
    final userCollection = FirebaseFirestore.instance.collection("users");
    final docRef = userCollection.doc();
    await docRef.set({
      "name": _nameController.text,
      "email": _emailController.text,
      "password": _passwordController.text,
    });
  }
//   Future creatUser({required String name}) async {
//     final docUser = FirebaseFirestore.instance.collection("user").doc();
//     final user = User(
//       id: docUser.id,
//       name: name,
//       email: _emailController.text,
//     );
//     final json = user.toJson();
//     await docUser.set(json);
//   }
// }

// class User {
//   String id;
//   final String name;
//   final String email;
//   User({required this.email, this.id = '', required this.name});
//   Map<String, dynamic> toJson() => {"id": id, 'name': name, "email": email};
}
