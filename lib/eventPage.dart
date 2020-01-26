import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './generateEvents.dart';
import 'package:google_fonts/google_fonts.dart';

class EventPage extends StatefulWidget {
  @override
  final Events event;

  EventPage(this.event);

  _EventPageState createState() => _EventPageState(event);
}

class _EventPageState extends State<EventPage> {
  final Events event;

  _EventPageState(this.event);

  var scaffoldKey = GlobalKey<ScaffoldState>();

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  IconData _goingIcon = Icons.check_circle_outline;
  IconData _interestedIcon = Icons.star_border;
  Color _goingColor = Colors.white;
  bool _isGoingPressed = false;
  bool _isInterestedPressed = false;
  Color _interestedColor = Colors.white;

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
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
        body: Column(children: <Widget>[
          Expanded(
              flex: 4,
              child: Stack(
                children: <Widget>[
                  Center(
                      child: Image(
                    image: NetworkImage(event.pic),
                    //fit: BoxFit.fitWidth,
                    alignment: Alignment.center,
                  )),
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
                                onPressed: () => null,
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
            flex: 4,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              //mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14.0, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 11.0),
                        child: Text(
                          event.name,
                          style: GoogleFonts.oxygen(
                              textStyle: TextStyle(
                                  fontSize: 30,
                                  color: hexToColor(event.color),
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: Icon(
                            Icons.alarm,
                            color: hexToColor(event.color),
                            size: 31.25,
                          ),
                          onPressed: () => null,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 11.0),
                          child: Text(
                            event.ldesc,
                            style: GoogleFonts.oxygen(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6.0, vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(_interestedIcon,
                                      color: _interestedColor, size: 30),
                                  onPressed: () {
                                    setState(() {
                                      if (!_isInterestedPressed) {
                                        _isInterestedPressed = true;
                                        _interestedIcon = Icons.star;
                                        _interestedColor = Colors.amber;
                                      } else {
                                        _isInterestedPressed = false;
                                        _interestedColor = Colors.white;
                                        _interestedIcon = Icons.star_border;
                                      }
                                      //isPressed= true;
                                    });
                                  }),
                              Text(
                                "Interested",
                                style: GoogleFonts.oxygen(
                                    textStyle: TextStyle(
                                        color: _interestedColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6.0, vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(_goingIcon,
                                    color: _goingColor, size: 30),
                                onPressed: () {
                                  setState(() {
                                    if (!_isGoingPressed) {
                                      _isGoingPressed = true;
                                      _goingIcon = Icons.check_circle;
                                      _goingColor = Colors.green;
                                    } else {
                                      _isGoingPressed = false;
                                      _goingColor = Colors.white;
                                      _goingIcon = Icons.check_circle_outline;
                                    }
                                    //isPressed= true;
                                  });
                                },
                              ),
                              Text(
                                "Going",
                                style: GoogleFonts.oxygen(
                                    textStyle: TextStyle(
                                        color: _goingColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
