import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/widget/custom_button.dart';
Widget actionButtonDesign(
  {
    required Widget buttonName,
    required Color buttonColor,
    required FutureOr<void> Function() onSuccess,
    GlobalKey<FormState>? loginKey,
    Object? argument
  }
){
  return InkWell(
    onTap: () async{
      if(loginKey != null){
        if(!loginKey.currentState!.validate()){
          return;
        }
      }
      await onSuccess();
    },
    child: standardButtonDesign(
      buttonName: buttonName,
      buttonColor: buttonColor,
      width: 326,
      height: 55
    ),
  );
}