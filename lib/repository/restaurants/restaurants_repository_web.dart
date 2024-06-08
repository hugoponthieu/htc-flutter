import 'dart:convert';

import 'package:htc_flutter/models/restaurant.dart';
import 'package:htc_flutter/repository/restaurants/restaurants_repository.dart';
import 'package:http/http.dart' as http;

class RestaurantsRepositoryWeb implements RestaurantsRepository {
  @override
  Future<List<Restaurant>?> getAll() async {
    List<Restaurant> restaurants = [];
    var response =
        await http.get(Uri.parse("https://api.hackthecrous.com/restaurants"));

    List res = json.decode(response.body);
    for (var restaurant in res) {
      restaurants.add(Restaurant.fromMap(restaurant));
    }
    return restaurants;
  }

  @override
  Future<Restaurant?> getOne(int id) {
    // TODO: implement getOne
    throw UnimplementedError();
  }
}
