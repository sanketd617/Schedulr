import 'package:schedulr/controllers/StorageController.dart';
import 'package:schedulr/Global.dart';
import 'package:schedulr/models/Institute.dart';
import 'dart:convert' as JSON;
import 'package:http/http.dart' as HTTP;

class APIController {
  static Future<List<Institute>> getInstitutes() async {
    // Create storage
    var url = AppConfig.serverURL + "/api/list/institutes";
    List<Institute> listOfInstitutes = [];

    var response = await HTTP.get(url);
    var json = JSON.jsonDecode(response.body);

    for (int i = 0; i < json['data'].length; i++) {
      var institute = Institute(
          json["data"][i]['name'],
          json["data"][i]['short_name'],
          json["data"][i]['city'],
          json["data"][i]['state'],
          json["data"][i]['server_url']);
      listOfInstitutes.add(institute);
      await StorageController.save("institutes", json);
    }
    return listOfInstitutes;
  }
}
