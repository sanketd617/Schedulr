import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:schedulr/global.dart';
import 'package:schedulr/main.dart';

class StudentHome extends StatefulWidget {
  StudentHome({Key key}) : super(key: key);

  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  final String url =
      "https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg";
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
                title: Text("Tom Cruise"),
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

  List buildList() {
    List<Widget> widgets = List();

    widgets.add(
      _makeWidget(Icons.notifications, "Notifications", "1 unread", ""),
    );

    widgets.add(
      _makeWidget(Icons.event_note, "Attendance", "85%", "Excellent"),
    );

    widgets.add(
      _makeWidget(Icons.calendar_today, "Time Table", "USP", "Up next : DCN"),
    );

    widgets.add(
      _makeWidget(Icons.event_seat, "Appointments", "None", ""),
    );

    widgets.add(
      _makeWidget(Icons.schedule, "Pending works", "None", ""),
    );

    return widgets;
  }

  InkWell _makeWidget(IconData icon, String heading, String subHeadingLeft,
      String subHeadingRight) {
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
      onTap: () {
        _key.currentState.showSnackBar(SnackBar(content: Text("Hello")));
      },
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
