import 'package:flutter/material.dart';
import 'package:htc_flutter/screens/story_screen.dart';
import 'package:htc_flutter/themes/text_theme.dart';

class HackTheCrousApp extends StatelessWidget {
  const HackTheCrousApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hack The Crous',
      theme: ThemeData(
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
      home: const StoryScreen(),
    );
  }
}


