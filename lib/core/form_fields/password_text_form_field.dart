import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:mini_ui_project/core/Validations/text_form_field_validate.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordTextFormField({
    super.key,
    required this.controller,
  });

  @override
  State<PasswordTextFormField> createState() =>
      _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState
    extends State<PasswordTextFormField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isHidden,
      decoration: InputDecoration(
        labelText: context.t.password,
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              isHidden = !isHidden;
            });
          },
          child: Icon(
            isHidden
                ? Icons.remove_red_eye_outlined
                : Icons.visibility_off_outlined,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) {
        if (!TextFormFieldValidate.emptyValidation(value)) {
          return context.t.pleaseEnterPassword;
        }

        if (!TextFormFieldValidate.checkPassowrdStrength(value)) {
          return context.t.atLeastPasswordContatinEightCharacters;
        }

        return null;
      },
    );
  }
}