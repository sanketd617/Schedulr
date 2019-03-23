import 'dart:async';

import 'package:flutter/material.dart';
import 'package:schedulr/controllers/StorageController.dart';
import 'package:schedulr/views/auth/SelectInstituteView.dart';
import 'package:schedulr/views/auth/LoginView.dart';
import 'package:schedulr/views/auth/LoginTypeView.dart';
import 'Global.dart';

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
        title: AppConfig.appName,
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        home: FutureBuilder(
            future: StorageController.getUser(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  if (snapshot.data == null) return homeWidget;
                  return loader();
                default:
                  return loader();
              }
            }));
  }
}
