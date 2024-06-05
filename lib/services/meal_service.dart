import 'package:htc_flutter/models/meal.dart';
import 'package:htc_flutter/repository/meals/meals_repository.dart';

class MealService {
  late MealsRepository mealsRepository;
  MealService({required this.mealsRepository});

  Future<List<Meal>?> getRestaurantMeals(int restaurantId) {
    return mealsRepository.getRestaurantMeals(restaurantId);
  }
}
