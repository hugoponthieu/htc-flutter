import 'package:flutter/material.dart';
import 'package:htc_flutter/themes/text_theme.dart';
import 'package:htc_flutter/widgets/arrow_button.dart';

class RestaurantCard extends StatelessWidget {
  final void Function(int) navigateToDetail;
  const RestaurantCard({super.key, required this.navigateToDetail});

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
                children: [
                  mealExpansionTile(context),
                  mealExpansionTile(context),
                ],
              ))
        ],
      ),
    );
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

  Widget mealExpansionTile(BuildContext context) {
    return ExpansionTile(
      maintainState: true,
      controlAffinity: ListTileControlAffinity.trailing,
      shape: Border.all(color: const Color.fromARGB(0, 0, 0, 0)),
      title: Text("test", style: Theme.of(context).textTheme.bodyMedium),
      children: const [
        Text(
          "first",
          style: bodySmallStyle,
        ),
        Text(
          "second",
          style: bodySmallStyle,
        )
      ],
    );
  }
}

// Test on panel

    // return ExpansionPanelList(
    //   expansionCallback: (panelIndex, isExpanded) {
    //     isExpanded = !isExpanded;
    //   },
    //   children: [
    //     ExpansionPanel(
    //         backgroundColor: const Color.fromARGB(255, 30, 30, 30),
    //         headerBuilder: (context, isExpanded) {
    //           return const Row(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [Text("test", style: bodyMediumStyle)],
    //           );
    //         },
    //         isExpanded: true,
    //         canTapOnHeader: true,
    //         body: const Text("test"))
    //   ],
    // );
    // return ExpansionPanel(
    //     headerBuilder: (context, isExpanded) {
    //       return Text("test");
    //     },
    //     body: Text("azer"));