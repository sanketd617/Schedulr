import 'package:flutter/material.dart';
import 'package:schedulr/views/DepartmentView.dart';
import 'package:schedulr/views/SubjectAttendanceView.dart';

class FacultyListPage extends StatefulWidget {
  FacultyListPage({Key key, this.type, this.deptShortName, this.department})
      : super(key: key);
  final String type, deptShortName, department;

  @override
  _FacultyListPageState createState() => _FacultyListPageState();
}

class _FacultyListPageState extends State<FacultyListPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int start = 0, total = 31, perPage = 10, numPages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.grey[900],
        title: Text(widget.type + " | " + widget.deptShortName),
        actions: <Widget>[],
      ),
      body: buildListView(),
    );
  }

  @override
  void initState() {
    super.initState();
    start = 0;
    total = 31;
    perPage = 10;
    if (total % perPage == 0) {
      numPages = (total / perPage).floor();
    } else {
      numPages = (total / perPage).floor() + 1;
    }
  }

  ListView buildListView() {
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index ==
              ((total - start) < perPage ? (total - start) : perPage)) {
            return _makePagination();
          }
          return _makeListTile(
              "Name Surname " + (start + index).toString(), "Department", "NS");
        },
        itemCount: ((total - start) < perPage ? (total - start) : perPage) + 1);
  }

  Container _makePagination() {
    var pagination = Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text("Page " +
              ((start / perPage).floor() + 1).toString() +
              " of " +
              numPages.toString()),
          FlatButton(
            onPressed: () {
              if (start > 0) {
                setState(() {
                  start -= perPage;
                });
              }
            },
            child: Icon(Icons.chevron_left),
            shape: CircleBorder(side: BorderSide(color: Colors.grey[900])),
          ),
          FlatButton(
            onPressed: () {
              if (total % perPage == 0) {
                if (start + perPage < total) {
                  setState(() {
                    start += perPage;
                  });
                }
              } else {
                if (start / perPage < numPages - 1) {
                  setState(() {
                    start += perPage;
                  });
                }
              }
            },
            child: Icon(Icons.chevron_right),
            shape: CircleBorder(side: BorderSide(color: Colors.grey[900])),
          ),
        ],
      ),
    );

    return pagination;
  }

  ListTile _makeListTile(String name, String regno, String shortName) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8.0),
      onTap: () {},
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
        name,
        style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
      ),
      subtitle: Text(regno),
      trailing: Icon(
        Icons.more_horiz,
        color: Colors.grey[900],
        size: 20.0,
      ),
    );
  }
}
