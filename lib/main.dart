import 'package:flutter/material.dart'; // Material package from Flutter
import 'package:google_fonts/google_fonts.dart'; // Google fonts package for using fonts
import 'models/constants.dart';
import 'ui/intray_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async => {runApp(MaterialApp(home: MyApp()))};

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
              // Container(
              //     height: 160,
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.only(
              //             bottomLeft: Radius.circular(60),
              //             bottomRight: Radius.circular(60))),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(left: 30),
              //           child: Text(
              //             'Intray',
              //             style: intrayTitleStyle,
              //           ),
              //         ),
              //         Container(),
              //       ],
              //     )),
              // Container(
              //   height: 70,
              //   width: 70,
              //   margin: EdgeInsets.only(
              //       top: 120,
              //       left: MediaQuery.of(context).size.width * 0.5 - 40),
              //   child: FloatingActionButton(
              //       backgroundColor: redColor,
              //       child: Icon(Icons.add, size: 40),
              //       onPressed: () {}),
              // ),
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
