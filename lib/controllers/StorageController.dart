import 'dart:async';
import 'dart:convert' as JSON;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:schedulr/models/Institute.dart';
import 'package:schedulr/models/User.dart';

class StorageController {
  static FlutterSecureStorage storage;
  static User user;

  static Future<User> getUser() async {
    if (storage == null)
      storage = new FlutterSecureStorage();

    String userString = await storage.read(key: "user");

    if (userString == null)
      return null;

    var json = JSON.jsonDecode(userString);
    User user = User.fromJSON(json);

    return user;
  }

  static Future<List<Institute>> getInstitutes() async {
    if (storage == null)
      storage = new FlutterSecureStorage();

    String institutesString = await storage.read(key: "institutes");

    if (institutesString == null)
      return null;

    var json = JSON.jsonDecode(institutesString);
    List<Institute> listOfInstitutes = [];

    for (int i = 0; i < json["data"].length; i++) {
      listOfInstitutes.add(Institute.fromJSON(json["data"][i]));
    }

    return listOfInstitutes;
  }

  static Future save(String key, json) async {
    if (storage == null)
      storage = new FlutterSecureStorage();

    String instituteString = JSON.jsonEncode(json);

    storage.write(key: key, value: instituteString);
  }

  static Future unsave(String key) async {
    if (storage == null)
      storage = new FlutterSecureStorage();

    storage.delete(key: key);
  }
}
