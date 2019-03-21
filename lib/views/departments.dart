import 'package:flutter/material.dart';
import 'package:schedulr/views/department.dart';
import 'package:schedulr/views/subject_attendance.dart';

class DepartmentsPage extends StatefulWidget {
  DepartmentsPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DepartmentsPageState createState() => _DepartmentsPageState();
}

class _DepartmentsPageState extends State<DepartmentsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.grey[900],
          title: Text("Departments"),
          actions: <Widget>[],
        ),
        body: ListView(
          children: <Widget>[
            _makeListTile(
                "Computer Science & Engineering", "H. O .D. HOD", "CSE"),
            _makeListTile("Information Technology", "H. O .D. HOD", "IT"),
            _makeListTile("Mechanical Engineering", "H. O .D. HOD", "MECH"),
            _makeListTile("Electrical Engineering", "H. O .D. HOD", "ELEC"),
            _makeListTile("Textile Engineering", "H. O .D. HOD", "TEXT"),
            _makeListTile("Production Engineering", "H. O .D. HOD", "PROD"),
            _makeListTile(
                "Instrumentation Engineering", "H. O .D. HOD", "INST"),
            _makeListTile("Civil Engineering", "H. O .D. HOD", "CVL"),
            _makeListTile("Electronics Engineering", "H. O .D. HOD", "EXTC"),
            _makeListTile("Chemical Engineering", "H. O .D. HOD", "CHEM"),
          ],
        ));
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
