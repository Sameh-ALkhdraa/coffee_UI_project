import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/widget/auth_widget/login_button.dart';

Widget nextButtonDesign({
  required BuildContext context,
  required String namedPage,
  }){
  return actionButtonDesign(
    buttonName: Text(context.t.next, style: homeTextStyle,),
    buttonColor: darkGreen,
    onSuccess: () {
      Navigator.pushReplacementNamed(context, namedPage);
    },
    );
}