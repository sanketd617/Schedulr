
class Institute {
  String name, city, shortName, serverURL, state;
  int id;

  Institute(this.name, this.shortName, this.city, this.state, this.serverURL,
      this.id);

  Map<String, Map<String, String>> toJSON() {
    return {
      "data": {
        "name": this.name,
        "short_name": this.shortName,
        "city": this.city,
        "state": this.state,
        "server_url": this.serverURL,
        "id": this.id.toString()
      }
    };
  }

  static Institute fromJSON(json) {
    return new Institute(
        json['name'],
        json['short_name'],
        json['city'],
        json['state'],
        json['server_url'],
        json['id']
    );
  }
}
