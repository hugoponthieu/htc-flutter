import 'package:htc_flutter/repository/meals/meals_repository.dart';
import 'package:htc_flutter/repository/meals/meals_repository_mock.dart';
import 'package:htc_flutter/repository/meals/meals_repository_web.dart';
import 'package:htc_flutter/repository/restaurants/restaurants_repository.dart';
import 'package:htc_flutter/repository/restaurants/restaurants_repository_mock.dart';
import 'package:htc_flutter/repository/restaurants/restaurants_repository_web.dart';
import 'package:htc_flutter/services/meal_service.dart';
import 'package:htc_flutter/services/restaurant_service.dart';

class Configuration {
  static late String envName;

  // Repositories
  static late RestaurantsRepository restaurantsRepository;
  static late MealsRepository mealsRepository;

  //Services
  static late RestaurantService restaurantService;
  static late MealService mealService;

  void init(String? appEnv) {
    envName = appEnv ?? 'mock';
    switch (envName) {
      case 'dev':
        _useWebRepositories();
        break;
      default:
        _useMockRepositories();
    }
    _useServices();
  }

  void _useMockRepositories() {
    restaurantsRepository = RestaurantsRepositoryMock();
    mealsRepository = MealsRepositoryMock();
  }

  void _useWebRepositories() {
    restaurantsRepository = RestaurantsRepositoryWeb();
    mealsRepository = MealsRepositoryWeb();
  }

  void _useServices() {
    restaurantService =
        RestaurantService(restaurantsRepository: restaurantsRepository);
    mealService = MealService(mealsRepository: mealsRepository);
  }
}
