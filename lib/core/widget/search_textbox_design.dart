import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';

Widget searchField({
  required TextEditingController controller,
  required ValueChanged<String> onChanged,
  required String hintText,
  required IconData leadingIcon,
  IconData? trailingIcon,
  required Color color,
}) {
  return Container(
    margin: EdgeInsets.all(15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: color,
    ),
    child: TextFormField(
      controller: controller,
      onChanged: onChanged,
      style: homeTextStyle,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        prefixIcon: Icon(leadingIcon),
        suffixIcon: trailingIcon != null ? Icon(trailingIcon, color: mediumGreen,) : null,
      ),
    ),
  );
}

