import 'package:flutter/material.dart';
import 'package:schedulr/views/SubjectAttendanceView.dart';

class AttendancePage extends StatefulWidget {
  AttendancePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.grey[900],
          title: Text("Attendance"),
          actions: <Widget>[],
        ),
        body: ListView(
          children: <Widget>[
            _makePercentageView(context),
            _makeListTile("Compiler Design & Optimization", "P. G. Kolapwar"),
            _makeListTile("Data Communication & Networking", "P. S. Nalawade"),
            _makeListTile("Unix System Programming", "R. K. Chavan"),
            _makeListTile(
                "Combinatorics, Probability & Statistics", "A. Bainwad"),
            _makeListTile("Software Engineering", "A. Nandedkar"),
          ],
        ));
  }

  Container _makePercentageView(BuildContext context) {
    const double marginHorizontal = 64.0;
    const double marginVertical = 16.0;
    double size = MediaQuery.of(context).size.width - 2 * marginHorizontal;
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: size,
            width: size,
            margin: const EdgeInsets.symmetric(
                horizontal: marginHorizontal, vertical: marginVertical),
            child: CircularProgressIndicator(
              value: 0.85,
            ),
          ),
          Positioned(
              height: size + 2 * marginVertical,
              width: size + 2 * marginHorizontal,
              child: Center(
                child: Text(
                  "85%",
                  style: TextStyle(fontSize: 96.0, color: Colors.blue),
                ),
              )),
        ],
      ),
    );
  }

  ListTile _makeListTile(String subject, String teacher) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubjectAttendancePage(),
            ));
      },
      leading: Container(
        padding: const EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
            border: Border(right: BorderSide(width: 1.0, color: Colors.grey))),
        child: Icon(
          Icons.subject,
          color: Colors.grey[900],
        ),
      ),
      title: Text(
        subject,
        style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
      ),
      subtitle: Text(teacher),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: Colors.grey[900],
        size: 20.0,
      ),
    );
  }
}
