class Foody {
  late List<String> content;
  late String type;

  Foody.fromMap(Map<String, dynamic> data) {
    content = [];
    for (var c in data["content"]) {
      content.add(c.toString());
    }
    type = data["type"] ?? "";
  }
}
