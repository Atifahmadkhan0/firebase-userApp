import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? password;
  final String? email;
  final String? name;

  UserModel({
    this.password,
    this.email,
    this.name,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      email: snapshot['email'],
      name: snapshot['name'],
      password: snapshot['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
      };
}
