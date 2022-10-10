import 'dart:html';

import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:users/login/login.dart';
import 'package:users/login/usermodel.dart';

class CreateUser extends StatefulWidget {
  CreateUser({
    required this.email,
    required this.name,
    super.key,
  });
  final String email;
  final String name;

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final form_key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();

    _nameController.dispose();
    super.dispose();
  }

  final user1 = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create user")),
      body: Form(
        key: form_key,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                height: 50,
                width: 400,
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      hintText: "Enter Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: 400,
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      hintText: "Enter Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextButton(onPressed: _create, child: Text("Add"))
            ],
          ),
        ),
      ),
    );
  }

  Future _create() async {
    final userCollection = FirebaseFirestore.instance.collection("employees");
    final docRef = userCollection.doc();
    await docRef.set({
      "name": _nameController.text,
      "email": _emailController.text,
    });
  }
}
