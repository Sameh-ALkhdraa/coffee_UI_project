import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/routing/app_routes.dart';
import 'package:mini_ui_project/core/widget/coffee_plate_widget.dart';
import 'package:mini_ui_project/core/widget/translate_text.dart';
import 'package:mini_ui_project/features/landing/widget/standard_screen_style.dart';
import 'package:mini_ui_project/localization/l10n/app_localization.dart';
import 'dart:math';

 Widget decorate(final double size) {
    final diamondSize = size * 0.3;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          item(
            top: 0,
            left: size * 0.3,
            size: diamondSize,
          ),
          item(
            top: size * 0.4,
            left: 0,
            size: diamondSize,
          ),
          item(
            top: size * 0.4,
            left: size * 0.6,
            size: diamondSize,
          ),
        ],
      ),
    );
  }

  Widget item({
    required double top,
    required double left,
    required double size,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: Transform.rotate(
        angle: pi / 4,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: darkYellow,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }



class LandingScreen1 extends StatelessWidget {

  Widget coffeeDesign(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 30),
              child: decorate(150)
            ),
          ],
        ),
      
      coffee(imagePath: "assets/images/coffeePlate.png", plateColor: lightGreen, imageWidth: 200, imageHeight: 200)
      ],
    );
  }

  Widget landingScreen1(BuildContext context){
    return standartLandingScreen(
            context: context,
            namedPage: AppRoutes.landingScreen2,
            coffeeDesign: coffeeDesign(), 
            landingDescribe: translatedText(context: context, text: AppLocalizations.of(context)!.coffeeFirstThenTalk, color: mediumGreen),
            stepperIndex: 0);
  }

  const LandingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: landingScreen1(context)
    );
  }
}