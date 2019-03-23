import 'package:flutter/material.dart';
import 'package:schedulr/Global.dart';
import 'package:schedulr/views/StudentListView.dart';
import 'package:schedulr/views/SubjectAttendanceView.dart';

class DepartmentPage extends StatefulWidget {
  DepartmentPage({Key key, this.department, this.shortName}) : super(key: key);
  final String department, shortName;

  @override
  _DepartmentPageState createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.grey[900],
          title: Text(
            widget.department,
            overflow: TextOverflow.ellipsis,
          ),
          actions: <Widget>[],
        ),
        body: ListView(
          children: <Widget>[
            _makePercentageView(context),
            _makeExpandableListTile("Students", "Total 500"),
            _makeListTile("Faculties", "Total 20"),
            _makeListTile("Labs & Classrooms", "Total 9"),
            _makeListTile("Time Table", "View"),
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
              value: 1.0,
            ),
          ),
          Positioned(
              height: size + 2 * marginVertical,
              width: size + 2 * marginHorizontal,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.account_balance,
                      size: 128.0,
                      color: Colors.blue,
                    ),
                    Text(
                      widget.shortName,
                      style: TextStyle(fontSize: 64.0, color: Colors.blue),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  ExpansionTile _makeExpandableListTile(String title, String subtitle) {
    return ExpansionTile(
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
        title,
        style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
      ),
      children: <Widget>[
        _makeStudentTypeTile(StudentType.firstYear),
        _makeStudentTypeTile(StudentType.secondYear),
        _makeStudentTypeTile(StudentType.thirdYear),
        _makeStudentTypeTile(StudentType.finalYear),
      ],
    );
  }

  ListTile _makeStudentTypeTile(String type) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 80.0),
      leading: Icon(Icons.class_),
      title: Text(type),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        viewStudents(type);
      },
    );
  }

  ListTile _makeListTile(String title, String subtitle) {
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
        title,
        style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: Colors.grey[900],
        size: 20.0,
      ),
    );
  }

  void viewStudents(String type) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StudentsListPage(
                type: type,
                department: widget.department,
                deptShortName: widget.shortName,
              ),
        ));
  }
}
