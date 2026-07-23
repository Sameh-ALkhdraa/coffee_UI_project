import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: darkGreen,
      child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 33.43,
            height: 33.43,
            decoration: BoxDecoration(
              color: Color(0xFF21262E),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: Icon(Icons.arrow_back, size: 20.6, color: darkYellow,),
            ),
          ),
        ),
    );
  }
}