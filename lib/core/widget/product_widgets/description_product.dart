import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/models/product_model/product.dart';

class DescriptionProduct extends StatelessWidget {
  final Product product;
  const DescriptionProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: darkGreen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
          context.t.description,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),

        const SizedBox(height: 12),

        Text(
          product.description,
          style: const TextStyle(
            color: Colors.white70,
            height: 1.6,
            fontSize: 15,
          ),
        ),
        ],
      ),
    );
  }
}