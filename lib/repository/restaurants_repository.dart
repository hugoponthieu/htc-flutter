import 'package:htc_flutter/models/restaurant.dart';

abstract class RestaurantsRepository {
  Future<Restaurant?> getOne(int id);
  Future<List<Restaurant>?> getAll(int id);
}