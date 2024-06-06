import 'package:flutter/material.dart';
import 'package:htc_flutter/config/configuration.dart';
import 'package:htc_flutter/models/meal.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  late Future<List<Meal>?> futureMeals;
  @override
  void initState() {
    futureMeals = Configuration.mealService.getRestaurantMeals(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times: ${const String.fromEnvironment('APP_ENV')}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Card(
              child: Row(children: [Text("test")]),
            ),
            // FutureBuilder(
            //   future: futureMeals,
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return RestaurantCard(
            //         navigateToDetail: (int id) {
            //           print(id);
            //         },
            //         meals: snapshot.data!,
            //       ) as Widget;
            //     } else {
            //       return SizedBox();
            //     }
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
