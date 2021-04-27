import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: DefaultTabController(
              length: 3,
              child: Scaffold(
                body: Stack(children: <Widget>[
                  TabBarView(
                    children: [
                      new Container(
                        color: Colors.yellow,
                      ),
                      new Container(
                        color: Colors.orange,
                      ),
                      new Container(
                        color: Colors.lightGreen,
                      ),
                    ],
                  ),
                  Container(
                      height: 130,
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
                              style: GoogleFonts.openSans(
                                  fontSize: 40, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container()
                        ],
                      ))
                ]),
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
              ))),
    );
  }
}
