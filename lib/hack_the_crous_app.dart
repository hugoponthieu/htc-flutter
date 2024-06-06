import 'package:flutter/material.dart';
import 'package:htc_flutter/screens/home_restaurant_screen.dart';
import 'package:htc_flutter/themes/text_theme.dart';

class HackTheCrousApp extends StatelessWidget {
  const HackTheCrousApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hack The Crous',
      theme: ThemeData(
        expansionTileTheme: const ExpansionTileThemeData(
            iconColor: Colors.white, collapsedIconColor: Colors.white),
        splashColor: const Color.fromARGB(255, 30, 30, 30),
        appBarTheme:
            const AppBarTheme(backgroundColor: Color.fromARGB(255, 12, 12, 12)),
        searchBarTheme: SearchBarThemeData(
          textStyle: const WidgetStatePropertyAll(bodyMediumStyle),
          backgroundColor:
              const WidgetStatePropertyAll(Color.fromARGB(255, 12, 12, 12)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          hintStyle: const WidgetStatePropertyAll(
              TextStyle(color: Color.fromARGB(255, 102, 93, 93))),
          side: const WidgetStatePropertyAll(
              BorderSide(width: 1, color: Color.fromARGB(255, 102, 93, 93))),
        ),
        listTileTheme: const ListTileThemeData(
          titleTextStyle: bodyMediumStyle,
        ),
        textTheme: const TextTheme(
            bodyLarge: bodyLargeStyle,
            bodyMedium: bodyMediumStyle,
            bodySmall: bodySmallStyle),
        cardTheme: const CardTheme(
          color: Color.fromARGB(255, 30, 30, 30),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 12, 12, 12),
        useMaterial3: true,
      ),
      home: const HomeRestaurantScreen(),
    );
  }
}
