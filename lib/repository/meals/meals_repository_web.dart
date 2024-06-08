import 'dart:convert';

import 'package:htc_flutter/models/meal.dart';
import 'package:htc_flutter/repository/meals/meals_repository.dart';
import 'package:http/http.dart';

class MealsRepositoryWeb implements MealsRepository {
  @override
  Future<List<Meal>?> getRestaurantMeals(int restaurantId) async {
    var response = await get(Uri.parse(
        "https://api.hackthecrous.com/restaurants/meals/$restaurantId"));
    List res = json.decode(response.body);
    List<Meal> meals = [];
    for (var meal in res) {
      meals.add(Meal.fromMap(meal));
    }
    return meals;
  }
}
