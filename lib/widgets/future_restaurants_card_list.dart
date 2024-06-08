import 'package:flutter/material.dart';
import 'package:htc_flutter/models/meal.dart';
import 'package:htc_flutter/models/restaurant.dart';
import 'package:htc_flutter/widgets/restaurant_card.dart';

class FutureRestaurantsCardList extends StatelessWidget {
  final Future<List<Restaurant>?> futureRestaurant;
  final Future<List<Meal>?> Function(int id) getRestaurantMeals;
  const FutureRestaurantsCardList(
      {super.key,
      required this.futureRestaurant,
      required this.getRestaurantMeals});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureRestaurant,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error occured while fetching restaurant");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return RestaurantCard(
                  navigateToDetail: (int id) {},
                  restaurant: snapshot.data![index],
                  getRestaurantMeals: getRestaurantMeals,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 4,
                );
              },
            ),
          );
        } else {
          return const Text("No data available");
        }
      },
    );
  }
}
