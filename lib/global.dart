import 'package:shared_preferences/shared_preferences.dart';

class User {
  User();
}

class AppDetails {
  static final String appName = "SomeApp";
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
