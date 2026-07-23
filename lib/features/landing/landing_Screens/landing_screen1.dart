import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/config/app_config.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/routing/app_routes.dart';
import 'package:mini_ui_project/core/widget/auth_widget/coffee_plate_widget.dart';
import 'package:mini_ui_project/core/widget/translate_text.dart';
import 'package:mini_ui_project/features/landing/widget/standard_screen_style.dart';
import 'dart:math';

import 'package:provider/provider.dart';

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


class LandingScreen1 extends StatefulWidget {
  const LandingScreen1({super.key});

  @override
  State<LandingScreen1> createState() => _LandingScreen1State();
}

class _LandingScreen1State extends State<LandingScreen1> {
  
  @override
  void initState() {
    super.initState();
    final appConfig = Provider.of<AppConfig>(context, listen: false);
    appConfig.setIsFirstTime(false);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<AppConfig>().setIsFirstTime(false);
    // });
  }
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
            page: AppRoutes.landingScreen2,
            coffeeDesign: coffeeDesign(), 
            landingDescribe: translatedText(context: context, text: context.t.coffeeFirstThenTalk, color: mediumGreen),
            stepperIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: landingScreen1(context)
    );
  }
}