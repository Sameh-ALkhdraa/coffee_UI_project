import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';

class PriceText extends StatelessWidget {
  final double price;
  const PriceText({
    super.key, 
    required this.price
  });

  @override
  Widget build(BuildContext context) {
  return RichText(
    text: TextSpan(
      children: [

        const TextSpan(
          text: "\$ ",
          style: TextStyle(
            color: darkYellow,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),

        TextSpan(
          text: price.toStringAsFixed(2),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ],
    ),
  );
  }
}