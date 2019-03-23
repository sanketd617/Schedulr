import 'package:flutter/material.dart';
import 'dart:core';

class AppConfig {
  static final String appName = "SomeApp";
  static final String serverURL = "http://3.89.93.88:/schedulr";
}

class LoginType {
  static final String studentLogin = "Student Login";
  static final String facultyLogin = "Faculty Login";
  static final String instituteLogin = "Institute Login";
}

class AttendanceStatus {
  static final int present = 1;
  static final int absent = 2;
  static final int offLecture = 3;
  static final int holiday = 4;
}

class StudentType {
  static final String firstYear = "First Year";
  static final String secondYear = "Second Year";
  static final String thirdYear = "Third Year";
  static final String finalYear = "Final Year";
}

Container loader() {
  return Container(
    decoration: BoxDecoration(color: Colors.white),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Center somethingWentWrong() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.error_outline,
          size: 64.0,
        ),
        Text("Something went wrong!")
      ],
    ),
  );
}
