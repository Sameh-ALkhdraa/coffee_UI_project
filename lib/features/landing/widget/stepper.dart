import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';

Widget coffeeProgressIndicator({
  required int index, // 0, 1, 2
}) {

  Widget dot() {
    return Container(
      width: 15,
      height: 15,
      decoration: const BoxDecoration(
        color: coffeeColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget bean() {
    return SizedBox(
      width: 25,
      height: 25,
      child: Image.asset(
        'assets/images/ph_coffee-bean-fill.png',
        fit: BoxFit.fill,
      ),
    );
  }

  List<Widget> buildLayout() {
    switch (index) {
      case 0:
        // [bean] dot dot
        return [
          bean(),
          // const SizedBox(width: 8),
          dot(),
          // const SizedBox(width: 8),
          dot(),
        ];

      case 1:
        // dot [bean] dot
        return [
          dot(),
          // const SizedBox(width: 8),
          bean(),
          // const SizedBox(width: 8),
          dot(),
        ];

      case 2:
      default:
        // dot dot [bean]
        return [
          dot(),
          // const SizedBox(width: 8),
          dot(),
          // const SizedBox(width: 8),
          bean(),
        ];
    }
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: buildLayout(),
  );
}