import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/arabic_settings.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';

Widget translatedText({
  required BuildContext context,
  required String text,
  required Color color
  }
) {

  return Text(
    text,
    textDirection:isArabic(context) ? TextDirection.rtl : TextDirection.ltr,
    style: TextStyle(color: color, fontSize: 24, fontWeight: FontWeight(500)),
  );
}

TextSpan translatedSpan(
  BuildContext context,
  String text,
) {
  return TextSpan(
    text: text,
    style: landingTextStyle,
  );
}