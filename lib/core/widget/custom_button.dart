import 'package:flutter/material.dart';

Widget standardButtonDesign({
  required BuildContext context,
  required String buttonName,
  required Color buttonColor,
  required Color textColor,
  required String namedPage,
  GlobalKey<FormState>? loginKey,
  Object? argument

}){
  return InkWell(
    onTap: () {
      if(loginKey != null){
        if(!loginKey.currentState!.validate()){
          return;
        }
      }
    Navigator.pushReplacementNamed(context, namedPage, arguments: argument);
    },
    child: Container(
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(16)
      ),
      width: 326,
      height: 55,
    
      child: Center(
        child: Text(buttonName, style: TextStyle(color: textColor, fontSize: 20),),
      ),
    ),
  );
}