import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/widget/auth_widget/login_button.dart';

Widget navigateButton(
  {
    required String buttonName,
    required String pageName,
    required BuildContext context,
  }
){
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: darkGreen),
      borderRadius: BorderRadius.circular(16)
    ),
    child: actionButtonDesign(
      buttonName: Text(buttonName, style: homeTextStyle.copyWith(color: darkGreen),),
      buttonColor: Colors.transparent,
      onSuccess:() {
        Navigator.pushReplacementNamed(
          context,
          pageName,
        );
      },
    ),
  );
}