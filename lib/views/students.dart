import 'package:flutter/material.dart';
import 'package:schedulr/views/department.dart';
import 'package:schedulr/views/subject_attendance.dart';

class StudentsListPage extends StatefulWidget {
  StudentsListPage({Key key, this.type, this.deptShortName, this.department})
      : super(key: key);
  final String type, deptShortName, department;

  @override
  _StudentsListPageState createState() => _StudentsListPageState();
}

class _StudentsListPageState extends State<StudentsListPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.grey[900],
        title: Text(widget.type + " | " + widget.deptShortName),
        actions: <Widget>[],
      ),
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Container(
                height: 64.0,
                width: 64.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    border: Border.all(color: Colors.grey)),
              ),
            );
          },
          itemCount: 20),
    );
  }

  ListTile _makeListTile(String department, String HOD, String shortName) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8.0),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DepartmentPage(
                    department: department,
                    shortName: shortName,
                  ),
            ));
      },
      leading: Container(
        height: 64.0,
        width: 64.0,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        child: Center(
          child: Text(shortName),
        ),
      ),
      title: Text(
        department,
        style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
      ),
      subtitle: Text(HOD),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: Colors.grey[900],
        size: 20.0,
      ),
    );
  }
}
