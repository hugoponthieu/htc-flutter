import 'package:flutter/material.dart';
import 'package:htc_flutter/models/meal.dart';
import 'package:htc_flutter/themes/text_theme.dart';

class ExpansionMealList extends StatelessWidget {
  final Future<List<Meal>?> futureMeals;
  const ExpansionMealList({super.key, required this.futureMeals});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureMeals,
      builder: (context, snapshot) {
        List<ExpansionTileController> tileControllers;
        if (snapshot.hasData) {
          tileControllers = List.generate(
              snapshot.data!.length, (index) => ExpansionTileController());
          return Container(
              constraints: const BoxConstraints.tightFor(width: 300),
              child: Column(
                  children: snapshot.data!
                      .asMap()
                      .entries
                      .map((entry) => mealExpansionTile(
                          entry.value, tileControllers, entry.key))
                      .toList()));
        } else {
          tileControllers = [];
          return const SizedBox();
        }
      },
    );
  }

  void collapseAllTiles(
      int controllerKey, List<ExpansionTileController> tileControllers) {
    for (var entry in tileControllers.asMap().entries) {
      if (entry.key != controllerKey) {
        if (entry.value.isExpanded) entry.value.collapse();
      }
    }
  }

  Widget mealExpansionTile(Meal meal,
      List<ExpansionTileController> tileControllers, int controllerKey) {
    print(meal);
    ExpansionTileController controller = tileControllers[controllerKey];
    return ExpansionTile(
        controller: controller,
        onExpansionChanged: (value) {
          if (controller.isExpanded) {
            collapseAllTiles(controllerKey, tileControllers);
          }
        },
        maintainState: true,
        controlAffinity: ListTileControlAffinity.trailing,
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
