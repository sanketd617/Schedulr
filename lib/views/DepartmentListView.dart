import 'package:flutter/material.dart';
import 'package:schedulr/Global.dart';
import 'package:schedulr/controllers/ApiController.dart';
import 'package:schedulr/controllers/StorageController.dart';
import 'package:schedulr/models/Department.dart';
import 'package:schedulr/models/Institute.dart';
import 'package:schedulr/views/DepartmentView.dart';
import 'package:schedulr/views/SubjectAttendanceView.dart';

class DepartmentsPage extends StatefulWidget {
  DepartmentsPage({Key key, this.title, this.institute}) : super(key: key);
  final String title;
  final Institute institute;
  @override
  _DepartmentsPageState createState() => _DepartmentsPageState();
}

class _DepartmentsPageState extends State<DepartmentsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.grey[900],
          title: Text("Departments"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh), onPressed: reloadList),
          ],
        ),
        body: body
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    body = buildBody();
  }

  void reloadList() {
    setState(() {
      body = FutureBuilder(
        future: APIController.getDepartments(widget.institute),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return buildListView(snapshot.data);
            } else if (snapshot.hasError) {
              return somethingWentWrong();
            }
          }
          return loader();
        },
      );
    });
  }

  FutureBuilder buildBody() {
    return FutureBuilder(
      future: StorageController.getDepartments(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError || snapshot.data == null) {
            return FutureBuilder(
              future: APIController.getDepartments(widget.institute),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return buildListView(snapshot.data);
                  } else if (snapshot.hasError) {
                    return somethingWentWrong();
                  }
                }
                return loader();
              },
            );
          }
          else if (snapshot.hasData) {
            return buildListView(snapshot.data);
          }
        }
        return loader();
      },
    );
  }

  ListView buildListView(List<Department> departments) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return _makeListTile(
          departments[index].name, departments[index].shortName,
          departments[index].hod.firstName + " " +
              departments[index].hod.lastName);
    }, itemCount: departments.length,);
  }

  ListTile _makeListTile(String department, String shortName, String hod) {
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
      subtitle: Text(hod),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: Colors.grey[900],
        size: 20.0,
      ),
    );
  }
}
