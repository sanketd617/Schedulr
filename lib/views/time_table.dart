import 'package:flutter/material.dart';

class TimeTablePage extends StatefulWidget {
  TimeTablePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TimeTablePageState createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<List<List<String>>> timeTable = [
    [
      ["[Practical] Android", "Nandedkar", "11:00 AM"],
      ["Long break", "", "01:00 PM"],
      ["Data Communication & Networking", "Nalawade", "02:00 PM"],
      ["Software Engineering", "Nandedkar", "03:00 PM"],
      ["Short break", "", "04:00 PM"],
      ["Unix System Programming", "RKC", "04:15 PM"]
    ], //Mon
    [
      ["[Practical] CPS", "Sarda", "11:00 AM"],
      ["Long break", "", "01:00 PM"],
      ["Unix System Programming", "RKC", "02:00 PM"],
      ["Data Communication & Networking", "Nalawade", "03:00 PM"],
      ["Short break", "", "04:00 PM"],
      ["Compiler Design & Optimization", "Kolapwar", "04:15 PM"]
    ], //Tue
    [
      ["[Practical] USP", "RKC", "11:00 AM"],
      ["Long break", "", "01:00 PM"],
      ["Software Engineering", "Nandedkar", "02:00 PM"],
      ["Unix System Programming", "RKC", "03:00 PM"],
      ["Short break", "", "04:00 PM"],
      ["Compiler Design & Optimization", "Kolapwar", "04:15 PM"]
    ], //Wed
    [
      ["[Practical] Seminar", "Solanki", "11:00 AM"],
      ["Long break", "", "01:00 PM"],
      ["Compiler Design & Optimization", "Kolapwar", "02:00 PM"],
      ["Software Engineering", "Nandedkar", "03:00 PM"],
      ["Short break", "", "04:00 PM"],
      ["Unix System Programming", "RKC", "04:15 PM"]
    ], //Thu
    [
      ["[Practical] CDO", "Vaidya", "11:00 AM"],
      ["Long break", "", "01:00 PM"],
      ["Combinatorics, Probability & Statistics", "Bainwad", "02:00 PM"],
      ["Data Communication & Networking", "Nalawade", "03:00 PM"],
      ["Short break", "", "04:00 PM"],
      ["Compiler Design & Optimization", "Kolapwar", "04:15 PM"]
    ], //Fri
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              backgroundColor: Colors.grey[900],
              title: Text("Time table"),
              actions: <Widget>[],
              bottom: TabBar(
                indicatorColor: Colors.white,
                tabs: <Widget>[
                  Tab(
                    text: "Mon",
                  ),
                  Tab(
                    text: "Tue",
                  ),
                  Tab(
                    text: "Wed",
                  ),
                  Tab(
                    text: "Thu",
                  ),
                  Tab(
                    text: "Fri",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: _makeTimetable(),
            )));
  }

  List<Widget> _makeTimetable() {
    return <Widget>[
      _makeTimeline(1),
      _makeTimeline(2),
      _makeTimeline(3),
      _makeTimeline(4),
      _makeTimeline(5),
    ];
  }

  ListView _makeTimeline(int day) {
    return ListView.builder(
        padding: const EdgeInsets.all(0.0),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(timeTable[day - 1][index][2]),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 2.0,
                      height: 32.0,
                      decoration: BoxDecoration(color: Colors.grey),
                    ),
                    Container(
                      height: 24.0,
                      width: 24.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          border: Border.all(color: Colors.grey)),
                    ),
                    Container(
                      width: 2.0,
                      height: 48.0,
                      decoration: BoxDecoration(color: Colors.grey),
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    height: 24 + 48 + 32.0,
                    padding: const EdgeInsets.fromLTRB(8.0, 32, 8.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _makeListItemRightSide(day, index),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        itemCount: timeTable[day - 1].length);
  }

  List<Widget> _makeListItemRightSide(int day, int index) {
    List<Widget> result = [];
    result.add(Text(
      timeTable[day - 1][index][0],
      style: TextStyle(fontSize: 18.0),
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
    ));

    if (timeTable[day - 1][index][1] != "") {
      result.add(Row(
        children: <Widget>[
          Icon(
            Icons.person,
            size: 14.0,
          ),
          Text(
            "  " + timeTable[day - 1][index][1],
            style: TextStyle(fontSize: 14.0, color: Colors.grey[500]),
          )
        ],
      ));
    }
    result.add(Row(
      children: <Widget>[
        Icon(
          Icons.access_time,
          size: 14.0,
        ),
        Text(
          "  Not started",
          style: TextStyle(fontSize: 14.0, color: Colors.grey[500]),
        )
      ],
    ));

    return result;
  }
}
