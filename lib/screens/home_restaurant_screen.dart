import 'package:flutter/material.dart';
import 'package:htc_flutter/config/configuration.dart';
import 'package:htc_flutter/models/meal.dart';
import 'package:htc_flutter/widgets/future_restaurants_card_list.dart';
import 'package:htc_flutter/widgets/logo.dart';

import '../models/restaurant.dart';

class HomeRestaurantScreen extends StatefulWidget {
  const HomeRestaurantScreen({super.key});

  @override
  State<HomeRestaurantScreen> createState() => _HomeRestaurantScreenState();
}

class _HomeRestaurantScreenState extends State<HomeRestaurantScreen> {
  late Future<List<Meal>?> futureMeals;
  late Future<List<Restaurant>?> futureRestaurant;
  @override
  void initState() {
    futureMeals = Configuration.mealService.getRestaurantMeals(1);
    futureRestaurant = Configuration.restaurantService.getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: searchAppBar(),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_dining_rounded),
              label: "Pouette",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_dining_rounded), label: "Pouette")
          ],
        ),
        body: FutureRestaurantsCardList(
          futureRestaurant: futureRestaurant,
          getRestaurantMeals: Configuration.mealService.getRestaurantMeals,
        ));
  }

  AppBar searchAppBar() {
    return AppBar(
      toolbarHeight: 80,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: logo,
        ),
        const Expanded(
            child: Padding(
          padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0),
          child: SearchBar(
            hintText: "Un plat, un restaurant",
            leading: Icon(
              Icons.search,
              size: 35,
            ),
          ),
        ))
      ],
    );
  }
}
