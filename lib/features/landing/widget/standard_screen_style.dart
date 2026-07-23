import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';

import 'package:mini_ui_project/features/landing/widget/next_Button.dart';
import 'package:mini_ui_project/features/landing/widget/stepper.dart';

Widget standartLandingScreen({
  required BuildContext context,
  required Widget coffeeDesign, 
  required String page,
  required Widget landingDescribe, 
  required int stepperIndex,
})
{
  return Container(
    color: lightYellow,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        coffeeDesign,
        SizedBox(height: 40,),
        landingDescribe,
        SizedBox(height: 30,),
        coffeeProgressIndicator(index: stepperIndex),
        SizedBox(height: 30,),
        nextButtonDesign(context: context, namedPage: page,)
        ]
    ),
  );
}
