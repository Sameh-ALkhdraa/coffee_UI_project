import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';

Widget paymentMethodTile({
  required IconData icon,
  required String title,
  double? amount,
}) {
  return Container(
    width: 300,
    height: 50,
    decoration: BoxDecoration(
      gradient: paymentCardGradient,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 40,
        ),

        const SizedBox(width: 10),

        Text(
          title,
          style: homeTextStyle
        ),

        const Spacer(),

        if (amount != null)
          Text(
            "\$${amount.toStringAsFixed(2)}",
            style: homeTextStyle
          ),
      ],
    ),
  );
}