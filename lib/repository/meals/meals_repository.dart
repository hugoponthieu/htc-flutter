import 'package:htc_flutter/models/meal.dart';

abstract class MealsRepository {
  Future<List<Meal>?> getRestaurantMeals(int restaurantId);
}
