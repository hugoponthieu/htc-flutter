import 'package:flutter/material.dart';
import 'package:htc_flutter/widgets/restaurant_card.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  void initState() {
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
            RestaurantCard(
              navigateToDetail: (int id) {
                print(id);
              },
            )
          ],
        ),
      ),
    );
  }
}
