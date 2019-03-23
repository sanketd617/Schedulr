import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  NotificationsPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              backgroundColor: Colors.grey[900],
              title: Text("Notifications"),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.done_all), onPressed: () {}),
                IconButton(
                    icon: Icon(Icons.notifications_off), onPressed: () {})
              ],
              bottom: TabBar(
                indicatorColor: Colors.white,
                tabs: <Widget>[
                  Tab(
                    text: "All",
                  ),
                  Tab(
                    text: "Unread",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                Icon(Icons.notifications),
                Icon(Icons.notifications_active),
              ],
            )));
  }
}
