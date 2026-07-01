import 'package:flutter/material.dart';
import 'package:mini_ui_project/features/auth/Validations/text_form_field_validate.dart';
import 'package:mini_ui_project/localization/l10n/app_localization.dart';
  TextEditingController loginUsernameController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
    bool isHidden = true;
    
Widget usernameTextFormField({required BuildContext context}){
  return TextFormField(
      decoration: InputDecoration(      
        labelText: AppLocalizations.of(context)!.username,
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12)
        )
      ),
    controller: loginUsernameController,
    validator:(value){
                    
      if(!TextFormFieldValidate.emptyValidation(value)){
        loginUsernameController.text = "";
        return AppLocalizations.of(context)!.pleaseEnterYourUsername;
      }
      else{
        return null;
      }
    }
    );
}

Widget passwordTextFormField({required VoidCallback onTap, required BuildContext context}){
  return TextFormField(
    decoration: InputDecoration(
      labelText: AppLocalizations.of(context)!.password,
      prefixIcon: Icon(Icons.lock),
      suffixIcon: InkWell(
        onTap: onTap,
        child: isHidden ? Icon(Icons.remove_red_eye_outlined) : Icon(Icons.cancel)
        ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12)
      )
    ),
    
    obscureText: isHidden,
    controller: loginPasswordController,
    validator:(value){
      if(!TextFormFieldValidate.emptyValidation(value)){
        loginPasswordController.text = "";
        return AppLocalizations.of(context)!.pleaseEnterPassword;
      }
      else if(!TextFormFieldValidate.checkPassowrdStrength(value)){
        return AppLocalizations.of(context)!.atLeastPasswordContatinEightCharacters;
      }
      else{
        return null;
      }
    }
  );
}