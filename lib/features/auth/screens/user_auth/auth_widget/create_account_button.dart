import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/routing/app_routes.dart';
import 'package:mini_ui_project/core/widget/custom_button.dart';
import 'package:mini_ui_project/localization/l10n/app_localization.dart';

Widget createAccountButtonDesign({   
    required BuildContext context, 
  }){
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: darkGreen),
      borderRadius: BorderRadius.circular(16)
    ),
    child: standardButtonDesign(
      context: context,
      buttonName: AppLocalizations.of(context)!.createAccount,
      namedPage: AppRoutes.registerScreen,
      buttonColor: Colors.transparent,
      textColor: darkGreen,
    ),
  );
}