import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './generateEvents.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    //final screenHeight = MediaQuery.of(context).size.height;
    var scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: scaffoldKey,
        drawer: new Drawer(
          child: Column(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                  accountName: Text("Jeet Mehta"),
                  accountEmail: Text("jeetsmehta13@gmail.com"))
            ],
          ),
        ),
        backgroundColor: Colors.black,
        body: Column(children: <Widget>[
          Expanded(
              flex: 5,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      'assets/prometheus2.png',
                      //fit: BoxFit.fitWidth,
                      alignment: Alignment.center,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                        width: 0,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 31.25,
                              ),
                              onPressed: () =>
                                  scaffoldKey.currentState.openDrawer(),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 31.25,
                                ),
                                onPressed: () =>
                                    null,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )),
          Expanded(
            flex: 3,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        for (var i = 0; i < 8; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 48),
                            child: GenEvents(
                              index: i,
                            ),
                          )
                      ],
                    ),
                  ))
                ]),
          )
        ]));
  }
}
