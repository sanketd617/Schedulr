// departments
// all depts
//faculties
//students
//timetable
//labs & classrooms
// declare holiday
// declaration form
// academic time table
// time table view
// Notifications
// notifications

import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:schedulr/Global.dart';
import 'package:schedulr/Main.dart';
import 'package:schedulr/views/AttendanceView.dart';
import 'package:schedulr/views/DepartmentListView.dart';
import 'package:schedulr/views/NotificationView.dart';
import 'package:schedulr/views/TimeTableView.dart';

class InstituteHome extends StatefulWidget {
  InstituteHome({Key key, this.instituteName}) : super(key: key);

  final String instituteName;

  @override
  _InstituteHomeState createState() => _InstituteHomeState();
}

class _InstituteHomeState extends State<InstituteHome> {
  final String url =
      "http://www.mhcsa.org.au/wp-content/uploads/2016/08/default-non-user-no-photo.jpg";
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.grey[900],
              expandedHeight: MediaQuery.of(context).size.height / 3,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                titlePadding: const EdgeInsets.all(8.0),
                title: Text(
                  widget.instituteName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16.0),
                ),
                background: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
              ),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.power_settings_new), onPressed: () {})
              ],
              floating: false,
              pinned: true,
            ),
            SliverList(delegate: SliverChildListDelegate(buildList()))
          ],
        ));
  }

  void openNotifications() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NotificationsPage(),
        ));
  }

  void openDepartments() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DepartmentsPage(),
        ));
  }

  void openAttendance() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AttendancePage(),
        ));
  }

  void openTimeTable() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TimeTablePage(),
        ));
  }

  List buildList() {
    List<Widget> widgets = List();

    widgets.add(
      _makeWidget(Icons.account_balance, "Departments", "View all departments",
          "", openDepartments),
    );

    widgets.add(
      _makeWidget(Icons.date_range, "Holidays", "View & declare holidays", "",
          openAttendance),
    );

    widgets.add(
      _makeWidget(Icons.notifications, "Notifications", "View notifications",
          "", openNotifications),
    );

    widgets.add(
      _makeWidget(Icons.calendar_today, "Academic time table",
          "View time table", "", openTimeTable),
    );

//    widgets.add(
//      _makeWidget(Icons.event_seat, "Appointments", "None", "", null),
//    );
//
//    widgets.add(
//      _makeWidget(Icons.schedule, "Pending works", "None", "", null),
//    );

    return widgets;
  }

  InkWell _makeWidget(IconData icon, String heading, String subHeadingLeft,
      String subHeadingRight, onCick) {
    Color primaryColor = Colors.grey[900];
    return InkWell(
      child: Card(
          elevation: 1.0,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Container(
                padding: const EdgeInsets.only(right: 12.0),
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.grey))),
                child: Icon(
                  icon,
                  color: primaryColor,
                ),
              ),
              title: Text(
                heading,
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: <Widget>[
                  Text(
                    " " + subHeadingLeft,
                    style: TextStyle(color: primaryColor),
                  ),
                  Text(
                    " " + subHeadingRight,
                    style: TextStyle(color: primaryColor),
                  )
                ],
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: primaryColor,
                size: 20.0,
              ),
            ),
          )),
      onTap: onCick,
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double x1 = 0.0;
    double y1 = size.height / 3;
    double x2 = size.width;
    double y2 = size.height / 7;
    double x3 = size.width;
    double y3 = 0.0;
    Path path = Path();
    path.lineTo(x1, y1);
    path.lineTo(x2, y2);
    path.lineTo(x3, y3);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
