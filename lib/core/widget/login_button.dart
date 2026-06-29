import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/widget/custom_button.dart';
import 'package:mini_ui_project/localization/l10n/app_localization.dart';

Widget loginButtonDesign(
  {
    required BuildContext context, 
    required Widget page,
    required GlobalKey<FormState> loginKey
  }
){
  return standardButtonDesign(
    context: context,
    buttonName: AppLocalizations.of(context)!.login,
    page: page,
    buttonColor: darkGreen,
    textColor: whiteButtonTextColor,
    loginKey: loginKey
  );
}