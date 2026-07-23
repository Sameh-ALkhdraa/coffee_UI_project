import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/form_fields/password_text_form_field.dart';
import 'package:mini_ui_project/core/form_fields/phone_picker_form_field.dart';
import 'package:mini_ui_project/core/form_fields/user_name_text_form_field.dart';




Widget formWidget(
  {
    required GlobalKey<FormState> loginKey,
    required TextEditingController loginUsernameController,
    required TextEditingController loginPasswordController,
    required TextEditingController phoneController,
    required double height,
    required ValueChanged<String> onCountryChanged,


  }
)
{
  return SizedBox(
    width: 300,
    height: height,
    child: Form(
      key: loginKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          UsernameTextFormField(controller: loginUsernameController),
          PhoneTextFormField(controller: phoneController, onCountryChanged: onCountryChanged),
          PasswordTextFormField(controller: loginPasswordController),
        ],
      ),
    ),
  );
}