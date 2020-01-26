import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import './eventPage.dart';

Future<List<Events>> _getEvents() async {
  var dio = Dio();
  Response dat = await dio.get("http://jeetmehta.pythonanywhere.com/events");
  Map data = json.decode(dat.toString());
  List<Events> events = [];
  for (var items in data['events']) {
    Events event = Events(
        items["name"],
        items["type"],
        items["sdesc"],
        items["ldesc"],
        int.parse(items["rating"]),
        items["pic"],
        items["color"]);
    events.add(event);
  }
  return events;
}

class GenEvents extends StatelessWidget {
  final int index;

  const GenEvents({Key key, @required this.index}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
            future: _getEvents(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(child: Text("Loading"));
              } else {
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              EventPage(snapshot.data[index]))),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                  Colors.blueGrey.withOpacity(0.3),
                                  BlendMode.dstATop),
                              child: Image(
                                  image: NetworkImage(snapshot.data[index].pic)),
                            )),
                      ),
                      Positioned.fill(
                          child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              snapshot.data[index].name,
                              style: GoogleFonts.oxygen(
                                  textStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Text("29th Sept",
                                style: GoogleFonts.oxygen(
                                    textStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w400)))
                          ],
                        ),
                      ))
                    ],
                  ),
                );
              }
            }));
  }
}

class Events {
  final String name;
  final String type;
  final String sdesc;
  final String ldesc;
  final int rating;
  final String pic;
  final String color;

  Events(this.name, this.type, this.sdesc, this.ldesc, this.rating, this.pic,
      this.color);
}
