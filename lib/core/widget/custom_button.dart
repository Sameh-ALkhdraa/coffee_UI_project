import 'package:flutter/material.dart';

Widget standardButtonDesign({
  required BuildContext context,
  required String buttonName,
  required Color buttonColor,
  required Color textColor,
  required Widget page,
  GlobalKey<FormState>? loginKey

}){
  return InkWell(
    onTap: () {
      if(loginKey != null){
        if(!loginKey.currentState!.validate()){
          return;
        }
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => page,
        ),
      );
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