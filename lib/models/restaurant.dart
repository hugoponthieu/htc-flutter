import 'package:htc_flutter/models/gps_coord.dart';

class Restaurant {
  final int id;
  final String url;
  final String name;
  final GpsCoord gpsCoord;
  Restaurant(this.id, this.url, this.name, this.gpsCoord);
}
