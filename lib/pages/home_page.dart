import 'dart:html';

import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:users/create%20user%20and%20view%20user%20Data/create_user.dart';
import 'package:users/create%20user%20and%20view%20user%20Data/viewdata.dart';

class HomePage extends StatefulWidget {
  final String email;
  final String name;

  HomePage({
    super.key,
    required this.email,
    required this.name,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Dashboard"))),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "Welcome",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateUser(
                                        email: widget.email,
                                        name: widget.name,
                                      )));
                        },
                        child: Text('Create User'))),
                SizedBox(
                  width: 50,
                ),
                Container(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewData(
                                        email: widget.email,
                                        name: widget.name,
                                      )));
                        },
                        child: Text('View User'))),
              ],
            ),
          ),
          Center(
              child: ElevatedButton(onPressed: signOut, child: Text("LogOut")))
        ],
      ),
    );
  }
}
