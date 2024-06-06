import 'package:htc_flutter/models/foody.dart';

class Meal {
  late int id;
  late String type;
  late String date;
  late List<Foody> foodies;

  Meal(this.id, this.date, this.foodies, this.type);

  Meal.fromMap(Map<String, dynamic> data) {
    id = data["ID"] ?? -1;
    type = data["Type"] ?? "";
    date = data["Day"] ?? "";
    foodies = [];
    for (var f in data["Foodies"]) {
      foodies.add(Foody.fromMap(f));
    }
  }
}
