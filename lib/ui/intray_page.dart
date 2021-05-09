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

  Future<String> data() async {
    await firebaseFirestore.collection("todos").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        return result.data();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder(
          stream: firebaseFirestore.collection('todos').snapshots(),
          builder: (context, snapshot) {
            List listTodos = snapshot.data.docs;
            print(snapshot.data.docs[0]['title']);
            ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(listTodos[index]['title'].toString()));
              },
              itemCount: listTodos.length,
            );
            return Container(
                // child: Text(listTodos[0]['title'].toString()),
                );
          },
        ),
      ],
    );
  }

  List<Widget> getList() {
    return [
      Container(
          height: 100,
          child: Text(
            'Buy Minecraft',
            style: TextStyle(fontSize: 26, color: darkGreyColor),
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          margin: EdgeInsets.all(14)),
      Container(
          height: 100,
          child: Text(
            'Buy Minecraft',
            style: TextStyle(fontSize: 26, color: darkGreyColor),
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          margin: EdgeInsets.all(14)),
      Container(
          height: 100,
          child: Text(
            'Buy Minecraft',
            style: TextStyle(fontSize: 26, color: darkGreyColor),
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          margin: EdgeInsets.all(14)),
    ];
  }
}
