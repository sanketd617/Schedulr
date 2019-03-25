import 'dart:convert' as JSON;
import 'package:schedulr/models/User.dart';

class Department {
  String name, shortName;
  int id;
  User hod;

  Department({this.name, this.shortName, this.id, this.hod});

  static Department fromJSON(json) {
    int _id = json["id"];
    User _hod = json["hod"] != null && json["hod"] != ""
        ? User.fromJSON(json["hod"])
        : null;
    return new Department(
        name: json["name"], shortName: json["short_name"], id: _id, hod: _hod);
  }

  Map<String, Map<String, String>> toJSON() {
    return {
      "data": {
        "name": this.name,
        "short_name": this.shortName,
        "hod": JSON.jsonEncode(this.hod),
        "id": this.id.toString()
      }
    };
  }
}
