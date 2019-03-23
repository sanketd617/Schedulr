import 'dart:async';
import 'dart:convert' as JSON;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:schedulr/models/Institute.dart';
import 'package:schedulr/models/User.dart';

class StorageController {
  static FlutterSecureStorage storage;
  static User user;

  static Future<User> getUser() async {
    // Create storage
    storage = new FlutterSecureStorage();

    return null;
  }

  static Future<List<Institute>> getInstitutes() async {
    // Create storage
    storage = new FlutterSecureStorage();

    String institutesString = await storage.read(key: "institutes");

    var json = JSON.jsonDecode(institutesString);
    List<Institute> listOfInstitutes = [];

    for (int i = 0; i < json["data"].length; i++) {
      listOfInstitutes.add(Institute(
          json["data"][i]['name'],
          json["data"][i]['short_name'],
          json["data"][i]['city'],
          json["data"][i]['state'],
          json["data"][i]['server_url']));
    }

    return listOfInstitutes;
  }

  static Future save(json) async {
    var storage = new FlutterSecureStorage();

    String instituteString = JSON.jsonEncode(json);

    storage.write(key: "institutes", value: instituteString);
  }
}
