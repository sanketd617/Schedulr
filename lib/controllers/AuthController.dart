import 'package:http/http.dart' as HTTP;
import 'dart:convert' as JSON;

import 'package:schedulr/models/User.dart';

class AuthController {
  static void login(String email, String password, String server,
      String loginType, onSuccess, onError) async {
    String url;
    url = server + "/api/signin";

    var response = await HTTP.post(url,
        body: {"email": email, "password": password, "loginType": loginType},
        headers: {"Accept": "application/json"});

    print(response.body + " " + response.statusCode.toString());
    switch (response.statusCode) {
      case 200:
        var json = JSON.jsonDecode(response.body);
        var user = User.fromJSON(json);
        onSuccess(user);
        break;
      case 500:
        break;
      default:
    }
  }
}
