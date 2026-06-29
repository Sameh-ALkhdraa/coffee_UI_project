
import 'package:flutter/material.dart';
import 'package:mini_ui_project/features/auth/screens/user_auth/auth_widget/auth_form_widget.dart';
import 'package:mini_ui_project/features/auth/widgets/common_auth_widgets.dart';

Widget commonAuthWidget({required VoidCallback onTap, required BuildContext context, required GlobalKey<FormState> key}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      authBackground(
        formWidget(
          onTap: onTap,
          context: context,
          loginKey: key
        ), 
        context
      ),

    ],
  );
}