import 'package:flutter/material.dart';
import 'package:htc_flutter/models/meal.dart';
import 'package:htc_flutter/themes/text_theme.dart';
import 'package:htc_flutter/widgets/arrow_button.dart';

class RestaurantCard extends StatelessWidget {
  final void Function(int) navigateToDetail;
  final List<Meal> meals;
  RestaurantCard(
      {super.key, required this.navigateToDetail, required this.meals})
      : tileControllers =
            List.generate(meals.length, (index) => ExpansionTileController());
  ExpansionTileController tileController = ExpansionTileController();
  List<ExpansionTileController> tileControllers = [];
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          restaurantTopTile(navigateToDetail, context),
          Container(
              constraints: const BoxConstraints.tightFor(width: 300),
              child: Column(
                  children: meals
                      .asMap()
                      .entries
                      .map((entry) => mealExpansionTile(
                          entry.value, tileControllers[entry.key], entry.key))
                      .toList()))
        ],
      ),
    );
  }

  void collapseAllTiles(int controllerKey) {
    for (var entry in tileControllers.asMap().entries) {
      if (entry.key != controllerKey) {
        entry.value.collapse();
      }
    }
  }

  Widget restaurantTopTile(
      void Function(int) navigateToDetail, BuildContext context) {
    return ListTile(
      title: Text(
        "test",
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: ArrowButton(onTap: () => navigateToDetail(1)),
      onTap: () => navigateToDetail(1),
    );
  }

  Widget mealExpansionTile(
      Meal meal, ExpansionTileController tileController, int controllerKey) {
    return ExpansionTile(
        controller: tileController,
        onExpansionChanged: (value) {
          if (tileController.isExpanded) collapseAllTiles(controllerKey);
        },
        maintainState: true,
        controlAffinity: ListTileControlAffinity.trailing,
        shape: Border.all(color: const Color.fromARGB(0, 0, 0, 0)),
        title: Text(meal.type, style: bodyMediumStyle),
        children: foodyDisplay(meal));
  }

  List<Widget> foodyDisplay(Meal meal) {
    return [
      ...meal.foodies.map(
        (foody) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Text(
                  "--${foody.type}--",
                  style: bodySmallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                ...foody.content.map(
                  (food) {
                    return Text(food, style: bodySmallStyle);
                  },
                )
              ],
            ),
          );
        },
      )
    ];
  }
}
