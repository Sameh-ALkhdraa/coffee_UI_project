import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/arabic_settings.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/widget/coffee_plate_widget.dart';


double width = 100;
double height = 100;

Widget _authCoffee(){
    return coffee(imagePath: "assets/images/auth_coffee_plate.png", plateColor: mediumYellow, imageWidth: width, imageHeight: height);
}
Widget authBackground(Widget authBody, BuildContext context){
  return Directionality(
    textDirection: isArabic(context) ? TextDirection.rtl : TextDirection.ltr,
    child: Container(
      margin: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: greenLemonColor,
      ),
      child: SizedBox(
        width: 300,
        height: 400,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // _position(context, authBody),
            Container(
              margin: EdgeInsets.only(top: 25, left: 10, right: 10),
              child: authBody
            ),
            Positioned(
              left: 0,
              right: 0,
              top: -height/2,
              child: _authCoffee(),
            )         
          ],
        ),
      ),
    ),
  );
}

