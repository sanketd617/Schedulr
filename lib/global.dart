//import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class _User {
  final String type, email, name, institute;

  _User({this.type, this.email, this.name, this.institute});
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

class StudentType {
  static final String UG_FirstY = "First Year (UG)";
  static final String UG_SecondY = "Second Year (UG)";
  static final String UG_ThirdY = "Third Year (UG)";
  static final String UG_FinalY = "Final Year (UG)";
  static final String PG_FirstY = "First Year (PG)";
  static final String PG_SecondY = "Second Year (PG)";
}
//
//class Storage {
//  static FlutterSecureStorage storage;
//  static _User user;
//
//  static Future<Storage> init() async {
//    // Create storage
//    storage = new FlutterSecureStorage();
//
//    String userType = await storage.read(key: "user.type");
//    String userEmail = await storage.read(key: "user.email");
//    String userName = await storage.read(key: "user.name");
//    String userInstitute = await storage.read(key: "user.institute");
//
//    user = new _User(type: userType, email: userEmail, name: userName, institute: userInstitute);
//  }
//}

