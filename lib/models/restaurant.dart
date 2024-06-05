import 'package:htc_flutter/models/gps_coord.dart';

class Restaurant {
  late int id;
  late String url;
  late String name;
  late GpsCoord gpsCoord;
  Restaurant(this.id, this.url, this.name, this.gpsCoord);

  Restaurant.fromMap(Map<String, dynamic> data) {
    id = data["id"] ?? 0;
    url = data["url"] ?? "";
    name = data["name"] ?? name;
    gpsCoord = GpsCoord.fromMap(data["gps_coord"]);                                                     
  }
}
