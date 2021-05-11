import 'package:flutter/material.dart'; // Material package from Flutter
import 'package:google_fonts/google_fonts.dart'; // Google fonts package for using fonts
import 'models/constants.dart';
import 'ui/intray_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => {runApp(MaterialApp(home: MyApp()))};

class MyApp extends StatefulWidget {
  // This widget is the root of your application
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
    Firebase.initializeApp();
  }

  // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  void addTodos() {
    print('opening dialog');
    TextEditingController taskName = new TextEditingController();
    TextEditingController deadline = new TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            padding: EdgeInsets.all(20),
            constraints: BoxConstraints.expand(
              height: 220,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(13)),
                color: darkGreyColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Add New Task",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                Container(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: taskName,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: "Name of task",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: redColor,
                      child: Text("Cancel"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    TextButton(
                      child: Text(
                        "Add",
                      ),
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('todos')
                            .add({"title": taskName.text}).then((dbref) => {
                                  dbref.set(
                                      {"title": taskName.text, "id": dbref.id})
                                });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );

    // firebaseFirestore.collection('todos').add({'title': 'Lets goo'});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              TabBarView(
                children: [
                  Intray(),
                  new Container(
                    color: Colors.orange,
                  ),
                  new Container(
                    color: Colors.lightGreen,
                  ),
                ],
              ),
              Container(
                  height: 160,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          'Intray',
                          style: intrayTitleStyle,
                        ),
                      ),
                      Container(),
                    ],
                  )),
              Container(
                height: 70,
                width: 70,
                margin: EdgeInsets.only(
                    top: 120,
                    left: MediaQuery.of(context).size.width * 0.5 - 40),
                child: FloatingActionButton(
                    backgroundColor: redColor,
                    child: Icon(Icons.add, size: 40),
                    onPressed: addTodos),
              ),
            ],
          ),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: new TabBar(
              tabs: [
                Tab(
                  icon: new Icon(Icons.home),
                ),
                Tab(
                  icon: new Icon(Icons.rss_feed),
                ),
                Tab(
                  icon: new Icon(Icons.perm_identity),
                ),
              ],
              labelColor: Colors.yellow,
              unselectedLabelColor: Colors.blue,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
