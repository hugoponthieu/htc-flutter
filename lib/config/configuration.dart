import 'package:htc_flutter/repository/restaurants/restaurants_repository.dart';
import 'package:htc_flutter/repository/restaurants/restaurants_repository_mock.dart';
import 'package:htc_flutter/repository/restaurants/restaurants_repository_web.dart';
import 'package:htc_flutter/services/restaurant_service.dart';

class Configuration {
  static late String envName;

  // Repositories
  static late RestaurantsRepository restaurantsRepository;

  //Services
  static late RestaurantService restaurantService;

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
  }

  void _useWebRepositories() {
    restaurantsRepository = RestaurantsRepositoryWeb();
  }

  void _useServices() {
    restaurantService =
        RestaurantService(restaurantsRepository: restaurantsRepository);
  }
}
