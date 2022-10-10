import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:users/screens/home_register_screen.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback showHomeRegisterScreen;
  const HomeScreen({super.key, required this.showHomeRegisterScreen});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
              "Login Account",
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
                  Text("You don't have account ?"),
                  TextButton(
                    onPressed: widget.showHomeRegisterScreen,
                    child: Text("Create"),
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
                      signIn();
                    },
                    child: Text("Login ")))
          ],
        ),
      )),
    );
  }
}




// class CreateUser extends StatefulWidget {
//   CreateUser({
//     required this.email,
//     required this.name,
//     super.key,
//   });
//   final String email;
//   final String name;

//   @override
//   State<CreateUser> createState() => _CreateUserState();
// }

// class _CreateUserState extends State<CreateUser> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.name)),
//     );
//   }
// }
