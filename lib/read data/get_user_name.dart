import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatefulWidget {
  final String documentId;

  const GetUserName({
    super.key,
    required this.documentId,
  });

  @override
  State<GetUserName> createState() => _GetUserNameState();
}

class _GetUserNameState extends State<GetUserName> {
  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();

    final _nameController = TextEditingController();
    deletaData(id) async {
      await FirebaseFirestore.instance.collection("employees").doc(id).delete();
    }

    CollectionReference users =
        FirebaseFirestore.instance.collection("employees");
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(widget.documentId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> docs =
                snapshot.data!.data() as Map<String, dynamic>;
            return Card(
              child: ListTile(
                title: Text('Name: ${docs['name']}'),
                subtitle: Text('Email: ${docs['email']}'),
                leading: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deletaData(snapshot.data!.id);
                      setState(() {});
                    }),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
