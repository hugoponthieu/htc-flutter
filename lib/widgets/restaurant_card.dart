import 'package:flutter/material.dart';
import 'package:htc_flutter/models/meal.dart';
import 'package:htc_flutter/models/restaurant.dart';
import 'package:htc_flutter/themes/text_theme.dart';
import 'package:htc_flutter/widgets/arrow_button.dart';
import 'package:htc_flutter/widgets/expansion_meal_list.dart';

class RestaurantCard extends StatelessWidget {
  final void Function(int) navigateToDetail;
  final Future<List<Meal>?> Function(int id) getRestaurantMeals;
  final Future<List<Meal>?> futureMeals;
  final Restaurant restaurant;
  RestaurantCard(
      {super.key,
      required this.navigateToDetail,
      required this.restaurant,
      required this.getRestaurantMeals})
      : futureMeals = getRestaurantMeals(restaurant.id);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          restaurantTopTile(navigateToDetail),
          ExpansionMealList(futureMeals: futureMeals)
        ],
      ),
    );
  }

  Widget restaurantTopTile(void Function(int) navigateToDetail) {
    return ListTile(
      title: Text(
        restaurant.name,
        style: bodyLargeStyle,
      ),
      trailing: ArrowButton(onTap: () => navigateToDetail(1)),
      onTap: () => navigateToDetail(1),
    );
  }
}
