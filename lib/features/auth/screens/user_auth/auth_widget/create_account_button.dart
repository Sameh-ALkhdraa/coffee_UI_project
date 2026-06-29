import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/widget/custom_button.dart';
import 'package:mini_ui_project/localization/l10n/app_localization.dart';

Widget createAccountButtonDesign({   
    required BuildContext context, 
    required Widget page,
  }){
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: darkGreen),
      borderRadius: BorderRadius.circular(16)
    ),
    child: standardButtonDesign(
      context: context,
      buttonName: AppLocalizations.of(context)!.createAccount,
      page: page,
      buttonColor: Colors.transparent,
      textColor: darkGreen,
    ),
  );
}