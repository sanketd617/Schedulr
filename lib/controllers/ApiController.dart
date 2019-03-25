import 'package:schedulr/controllers/StorageController.dart';
import 'package:schedulr/Global.dart';
import 'package:schedulr/models/Department.dart';
import 'package:schedulr/models/Institute.dart';
import 'dart:convert' as JSON;
import 'package:http/http.dart' as HTTP;
import 'package:schedulr/models/User.dart';

class APIController {
  static Future<List<Institute>> getInstitutes() async {
    // Create storage
    var url = AppConfig.serverURL + "/api/list/institutes";
    List<Institute> listOfInstitutes = [];

    var response = await HTTP.get(url);
    var json = JSON.jsonDecode(response.body);
    for (int i = 0; i < json['data'].length; i++) {
      var institute = Institute.fromJSON(json["data"][i]);
      listOfInstitutes.add(institute);
    }


    await StorageController.save("institutes", json);

    return listOfInstitutes;
  }

  static Future<List<Department>> getDepartments(Institute institute) async {
    var url = institute.serverURL + "/api/institute/get-departments";
    List<Department> listOfDepartments = [];

    var response = await HTTP.post(url);
    var json = JSON.jsonDecode(response.body);

    for (int i = 0; i < json['data'].length; i++) {
      var department = Department.fromJSON(json["data"][i]);
      listOfDepartments.add(department);
    }

    await StorageController.save("departments", json);

    print(listOfDepartments);

    return listOfDepartments;
  }

  static Future<List<User>> getStudents(Institute institute,
      Department department, String studentType) async {
    var url = institute.serverURL + "/api/institute/get-students";
    List<User> users = [];

    var response = await HTTP.post(url, body: {
      "department_id": department.id.toString(),
      "student_type": studentType
    });

    var json = JSON.jsonDecode(response.body);

    for (int i = 0; i < json['data'].length; i++) {
      var user = User.fromJSON(json["data"][i]);
      users.add(user);
    }

    await StorageController.save("departments", json);

    return users;
  }
}
