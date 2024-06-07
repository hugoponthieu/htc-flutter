import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:htc_flutter/models/meal.dart';
import 'package:htc_flutter/repository/meals/meals_repository.dart';

class MealsRepositoryMock implements MealsRepository {
  final jsonFilePath = 'json/meals.json';
  final resource = 'meals';
  final List<MockedMeals> mockedMeals = [];

  Future _fillList() async {
    if (mockedMeals.isEmpty) {
      var items = [];
      var response = await rootBundle.loadString(jsonFilePath);
      var data = await json.decode(response);
      items = data[resource];
      for (var meal in items) {
        mockedMeals.add(MockedMeals.fromMap(meal));
      }
    }
  }

  @override
  Future<List<Meal>?> getRestaurantMeals(int restaurantId) async {
    await _fillList();
    return mockedMeals
        .firstWhere((m) => m.restaurantId == restaurantId,
            orElse: () => MockedMeals(-1, []))
        .meals;
  }
}

class MockedMeals {
  late int restaurantId;
  late List<Meal> meals;

  MockedMeals(this.restaurantId, this.meals);

  MockedMeals.fromMap(Map<String, dynamic> data) {
    restaurantId = data["id"];
    meals = [];
    for (var m in data["meals"]) {
      meals.add(Meal.fromMap(m));
    }
  }
}
