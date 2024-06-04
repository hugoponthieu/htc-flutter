class GpsCoord {
  late double xValue;
  late double yValue;
  GpsCoord(this.xValue, this.yValue);

  GpsCoord.fromMap(Map<String, dynamic> data) {
    xValue = data["X"]  ?? 0.0;
    yValue = data["Y"]  ?? 0.0;
  }
}
