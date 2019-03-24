import 'package:http/http.dart' as HTTP;
import 'package:schedulr/Global.dart';
import 'package:schedulr/controllers/StorageController.dart';
import 'dart:convert' as JSON;

import 'package:schedulr/models/User.dart';

class AuthController {
  static void login(String email, String password, String server,
      String loginType, onSuccess, onError) async {
    String url;

    if (loginType == LoginType.studentLogin)
      url = server + "/api/student/signin";
    else if (loginType == LoginType.facultyLogin)
      url = server + "/api/faculty/signin";
    else if (loginType == LoginType.instituteLogin)
      url = AppConfig.serverURL + "/api/institute/signin";

    var response = await HTTP.post(url,
        body: {"email": email, "password": password},
        headers: {"Accept": "application/json"});

    var json = JSON.jsonDecode(response.body);

    switch (response.statusCode) {
      case 200:
        var user = User.fromJSON(json["data"]);
        StorageController.save("user", json["data"]);
        onSuccess(user);
        break;
      case 401:
      case 404:
        onError(json["error"]);
        break;
      case 422:
        onError("Invalid data supplied.");
        break;
      default:
        onError("Something went wrong!");
    }
  }

  static void logout(onLogout) async {
    await StorageController.unsave("user");
    await StorageController.unsave("institute");
    onLogout();
  }
}
