import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:mini_ui_project/core/Validations/text_form_field_validate.dart';
import 'package:mini_ui_project/localization/l10n/app_localization.dart';
  
class UsernameTextFormField extends StatelessWidget {
  final TextEditingController controller;

  const UsernameTextFormField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.username,
        prefixIcon: const Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) {
        if (!TextFormFieldValidate.emptyValidation(value)) {
          controller.clear();
          return context.t.pleaseEnterYourUsername;
        }
        return null;
      },
    );
  }
}