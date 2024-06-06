import 'package:flutter/material.dart';
import 'package:htc_flutter/config/configuration.dart';
import 'package:htc_flutter/models/meal.dart';
import 'package:htc_flutter/widgets/logo.dart';
import 'package:htc_flutter/widgets/restaurant_card.dart';

class HomeRestaurantScreen extends StatefulWidget {
  const HomeRestaurantScreen({super.key});

  @override
  State<HomeRestaurantScreen> createState() => _HomeRestaurantScreenState();
}

class _HomeRestaurantScreenState extends State<HomeRestaurantScreen> {
  late Future<List<Meal>?> futureMeals;
  @override
  void initState() {
    futureMeals = Configuration.mealService.getRestaurantMeals(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FutureBuilder(
            future: futureMeals,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return RestaurantCard(
                  navigateToDetail: (int id) {
                    print(id);
                  },
                  meals: snapshot.data!,
                ) as Widget;
              } else {
                return SizedBox();
              }
            },
          )
        ],
      ),
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
