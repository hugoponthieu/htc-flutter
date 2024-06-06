import 'package:htc_flutter/models/restaurant.dart';
import 'package:htc_flutter/repository/restaurants/restaurants_repository.dart';

class RestaurantService {
  late RestaurantsRepository restaurantsRepository;

  RestaurantService({required this.restaurantsRepository});

  Future<Restaurant?> getOne(int id) {
    return restaurantsRepository.getOne(id);
  }

  Future<List<Restaurant>?> getAll() {
    return restaurantsRepository.getAll();
  }
}
