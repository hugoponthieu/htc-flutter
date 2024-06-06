import 'package:flutter/material.dart';
import 'package:htc_flutter/config/configuration.dart';
import 'package:htc_flutter/models/meal.dart';
import 'package:htc_flutter/widgets/logo.dart';
import 'package:htc_flutter/widgets/restaurant_card.dart';

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
        body: FutureBuilder(
          future: futureRestaurant,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("data");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return RestaurantCard(
                    navigateToDetail: (int id) {
                      print(id);
                    },
                    meals: [],
                    restaurantName: snapshot.data![index].name,
                  );
                },
              );
            } else {
              return const Text("No data available");
            }
          },
        )
        );
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
