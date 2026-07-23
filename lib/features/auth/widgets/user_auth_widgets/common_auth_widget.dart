
import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/widget/auth_widget/auth_form_widget.dart';
import 'package:mini_ui_project/features/auth/widgets/common_auth_widgets.dart';

Widget commonAuthWidget({
  required BuildContext context,
  required GlobalKey<FormState> key,
  required TextEditingController usernameController,
  required TextEditingController passwordController,
  required TextEditingController phoneController,
  required ValueChanged<String> onCountryChanged,

}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      authBackground(
        formWidget(
          loginKey: key,
          loginUsernameController: usernameController,
          loginPasswordController: passwordController,
          phoneController: phoneController,
          height: 300,
          onCountryChanged: onCountryChanged
        ),
        context
      ),

    ],
  );
}