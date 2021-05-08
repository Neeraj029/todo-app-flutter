import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todaydos/models/constants.dart'; // Material package from Flutter
import 'package:cloud_firestore/cloud_firestore.dart';

class Intray extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    firestore.collection("users").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
      });
    });
    return Container(
        padding: EdgeInsets.only(top: 200),
        height: 100,
        width: 100,
        decoration: BoxDecoration(color: darkGreyColor),
        child: ListView(
          children: getList(),
        ));
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
