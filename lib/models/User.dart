class User {
  final String type, email, firstName, lastName, regNo;

  User({this.type, this.email, this.firstName, this.lastName, this.regNo});

  static User fromJSON(json) {
    return new User(
        email: json["email"],
        firstName: json["firstname"],
        lastName: json["lastname"],
        regNo: json["regno"]);
  }

  Map<String, String> toJSON() {
    return {
      "email": this.email,
      "firstname": this.firstName,
      "lastname": this.lastName,
      "regno": this.regNo
    };
  }
}
