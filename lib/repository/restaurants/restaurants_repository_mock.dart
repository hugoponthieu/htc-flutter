import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:htc_flutter/models/restaurant.dart';
import 'package:htc_flutter/repository/restaurants/restaurants_repository.dart';

class RestaurantsRepositoryMock implements RestaurantsRepository {
  final jsonFilePath = 'json/restaurants.json';
  final resource = 'restaurants';
  final List<Restaurant> restaurants = [];
  Future _fillList() async {
    if (restaurants.isEmpty) {
      var items = [];
      var response = await rootBundle.loadString(jsonFilePath);
      var data = await json.decode(response);

      items = data[resource];
      for (var restaurant in items) {
        restaurants.add(Restaurant.fromMap(restaurant));
      }
    }
  }

  @override
  Future<List<Restaurant>?> getAll() async {
    await _fillList();
    return restaurants;
  }

  @override
  Future<Restaurant?> getOne(int id) async {
    await _fillList();
    return restaurants.firstWhere((r) => r.id == id);
  }
}
