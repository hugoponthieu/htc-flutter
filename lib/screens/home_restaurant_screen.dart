import 'package:flutter/material.dart';
import 'package:htc_flutter/widgets/logo.dart';

class HomeRestaurantScreen extends StatefulWidget {
  const HomeRestaurantScreen({super.key});

  @override
  State<HomeRestaurantScreen> createState() => _HomeRestaurantScreenState();
}

class _HomeRestaurantScreenState extends State<HomeRestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: searchAppBar(),
        body: const Row(
          children: [],
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
