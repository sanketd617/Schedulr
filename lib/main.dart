import 'dart:async';

import 'package:flutter/material.dart';
import 'package:schedulr/views/select_institute.dart';
import 'views/login.dart';
import 'views/login_type.dart';
import 'global.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    Widget homeWidget = LoginTypePage(title: 'Login Type Page');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppDetails.appName,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
        home: homeWidget
    );
  }

}