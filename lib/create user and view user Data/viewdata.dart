import 'dart:html';

import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:users/data/collection_data.dart';
import 'package:users/login/login.dart';
import 'package:users/login/usermodel.dart';
import 'package:users/read%20data/get_user_name.dart';

class ViewData extends StatefulWidget {
  final String email;
  final String name;
  const ViewData({super.key, required this.email, required this.name});

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final userss = FirebaseAuth.instance.currentUser!.email;
  final user = FirebaseAuth.instance.currentUser!.uid;
  List<String> docIds = [];
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('employees').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIds.add(document.reference.id);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Data")),
      body: FutureBuilder(
          future: getDocId(),
          builder: (
            context,
            snapshot,
          ) {
            return ListView.builder(
                itemCount: docIds.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: GetUserName(
                    documentId: docIds[index],
                  ));
                });
          }),
    );
    // StreamBuilder<List<UserModel>>(

    //     builder: (context, snapshot) {
    //       return ListView.builder(itemBuilder: (context, index) {
    //         final userData = snapshot.data;
    //         return Expanded(
    //           child: ListView.builder(
    //               itemCount: userData!.length,
    //               itemBuilder: (context, index) {
    //                 final singleUser = userData[index];
    //                 return Container(
    //                   margin: EdgeInsets.symmetric(vertical: 5),
    //                   child: ListTile(onLongPress: () {
    //                     showDialog(
    //                         context: context,
    //                         builder: (context) {
    //                           return AlertDialog(
    //                             title: Text("Delete"),
    //                             content:
    //                                 Text("are you sure you want to delete"),
    //                             actions: [
    //                               ElevatedButton(
    //                                   child: Text('data'),
    //                                   onPressed: () {
    //                                     FirestoreHelper.delete(singleUser)
    //                                         .then((value) {
    //                                       Navigator.pop(context);
    //                                     });
    //                                   }),
    //                             ],
    //                           );
    //                         });
    //                   }),
    //                 );
    //               }),
    //         );
    //       });
    //     });
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
















// import 'package:flutter/material.dart';
// import 'package:users/login/login.dart';
// import 'package:users/login/usermodel.dart';

// class ViewData extends StatefulWidget {
//   const ViewData({super.key});

//   @override
//   State<ViewData> createState() => _ViewDataState();
// }

// class _ViewDataState extends State<ViewData> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<List<UserModel>>(
//         stream: FirestoreHelper.read(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           if (snapshot.hasError) {
//             return Center(
//               child: Text("some error occured"),
//             );
//           }
//           if (snapshot.hasData) {
//             final userData = snapshot.data;
//             return Expanded(
//               child: ListView.builder(
//                   itemCount: userData!.length,
//                   itemBuilder: (context, index) {
//                     final singleUser = userData[index];
//                     return Container(
//                       margin: EdgeInsets.symmetric(vertical: 5),
//                       child: ListTile(
//                         onLongPress: () {
//                           showDialog(
//                               context: context,
//                               builder: (context) {
//                                 return AlertDialog(
//                                   title: Text("Delete"),
//                                   content:
//                                       Text("are you sure you want to delete"),
//                                   actions: [
//                                     ElevatedButton(
//                                         onPressed: () {
//                                           FirestoreHelper.delete(singleUser)
//                                               .then((value) {
//                                             Navigator.pop(context);
//                                           });
//                                         },
//                                         child: Text("Delete"))
//                                   ],
//                                 );
//                               });
//                         },
//                         leading: Container(
//                           width: 40,
//                           height: 40,
//                           decoration: BoxDecoration(
//                               color: Colors.deepPurple, shape: BoxShape.circle),
//                         ),
//                         title: Text("${singleUser.name}"),
//                         subtitle: Text("${singleUser.email}"),
//                         trailing: InkWell(onTap: () {}),
//                       ),
//                     );
//                   }),
//             );
//           }
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//     });
//   }
// }
