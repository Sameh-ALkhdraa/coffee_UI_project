import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mini_ui_project/core/widget/common_text_from_field.dart';
import 'package:mini_ui_project/features/auth/Validations/text_form_field_validate.dart';
import 'package:mini_ui_project/localization/l10n/app_localization.dart';


Widget formWidget(
  {
    required VoidCallback onTap, 
    required BuildContext context,
    required GlobalKey<FormState> loginKey

  }
)
{
  final phoneController = TextEditingController();
  
  return SizedBox(
    width: 300,
    height: 300,
    child: Form(
      key: loginKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          usernameTextFormField(context: context),
          IntlPhoneField(
            controller: phoneController,
            initialCountryCode: 'SY', // غيرها حسب الدولة الافتراضية
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.phone,
              counterText: "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            validator: (phone) {
                if(!TextFormFieldValidate.emptyValidationOnPhone(phone)){
                  phoneController.text = "";
                  return "Please enter your phone";
                }
              return null;
            },
          ),
          passwordTextFormField(onTap: onTap, context: context),
        ],
      ),
    ),
  );
}