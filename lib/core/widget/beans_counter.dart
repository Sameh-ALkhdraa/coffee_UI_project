import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';

class BeansCounter extends StatelessWidget {
  final int beans;

  const BeansCounter({
    super.key,
    required this.beans,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: Row(
        children: [
          Image.asset("assets/images/game-icons_coffee-beans.png", color: mediumYellow,),
      
          Text(
            beans.toString(),
            style: const TextStyle(
              color: mediumYellow, 
              fontSize: 22.5
            ),
          ),
        ],
      ),
    );
  }
}