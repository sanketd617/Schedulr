import 'package:flutter/material.dart';
import 'views/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Schedulr',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: LoginPage(title: 'Login'),
    );
  }
}
