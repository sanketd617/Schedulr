import 'package:flutter/material.dart';

class TimeTablePage extends StatefulWidget {
  TimeTablePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TimeTablePageState createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
              children: <Widget>[
                Icon(Icons.notifications),
                Icon(Icons.notifications_active),
                Icon(Icons.notifications_active),
                Icon(Icons.notifications_active),
                Icon(Icons.notifications_active),
              ],
            )));
  }
}
