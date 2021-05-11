import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todaydos/models/constants.dart'; // Material package from Flutter
import 'package:cloud_firestore/cloud_firestore.dart';

class Intray extends StatefulWidget {
  @override
  _IntrayState createState() => _IntrayState();
}

class _IntrayState extends State<Intray> {
  @override
  initState() {
    super.initState();
    Firebase.initializeApp();
  }

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: darkGreyColor),
        padding: EdgeInsets.only(top: 200),
        child: StreamBuilder(
            stream: firebaseFirestore.collection('todos').snapshots(),
            builder: (context, snapshot) {
              List listTodos = snapshot.data.docs;
              return ListView.builder(
                itemCount: listTodos.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return Dismissible(
                      key: Key(UniqueKey().toString()),
                      onDismissed: (DismissDirection direction) {
                        if (direction == DismissDirection.startToEnd) {
                          print('added');
                        } else {
                          firebaseFirestore
                              .collection('todos')
                              .doc(listTodos[index]['id'])
                              .delete();
                        }

                        setState(() {
                          listTodos.removeAt(index);
                        });
                      },
                      child: ListTile(
                          title: Container(
                              height: 100,
                              child: Text(
                                ds['title'],
                                style: TextStyle(
                                    fontSize: 26, color: darkGreyColor),
                              ),
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              margin: EdgeInsets.all(14))));
                },
              );
            }));
  }
}
