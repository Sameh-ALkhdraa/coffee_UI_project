import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:mini_ui_project/core/system_users/current_user.dart';
import 'package:mini_ui_project/core/Validations/text_form_field_validate.dart';
import 'package:flutter/services.dart';
class PhoneTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onCountryChanged;

  const PhoneTextFormField({
    super.key,
    required this.controller,
    required this.onCountryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      initialCountryCode: currentUser?.countryCode ?? "SY",
      keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
      decoration: InputDecoration(
        labelText:context.t.phone,
        counterText: "",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onChanged: (phone) {
        onCountryChanged(phone.countryISOCode);
      },
      validator: (phone) {
        if (!TextFormFieldValidate.emptyValidationOnPhone(phone)) {
          controller.clear();
          return context.t.pleaseEnterPhoneNumber;
        }
        return null;
      },
    );
  }
}