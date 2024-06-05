import 'package:flutter/material.dart';

class ArrowButton extends StatelessWidget {
  final void Function() onTap;
  final Color color;
  const ArrowButton(
      {super.key,
      required this.onTap,
      this.color = const Color.fromARGB(255, 103, 242, 109)});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          child: const Icon(Icons.arrow_outward),
        ));
  }
}
