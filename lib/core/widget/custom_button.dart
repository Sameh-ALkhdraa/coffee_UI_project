import 'package:flutter/material.dart';

Widget standardButtonDesign({
  required Widget buttonName,
  required Color buttonColor,
  required double width,
  required double height,

}){
  return Container(
    decoration: BoxDecoration(
      color: buttonColor,
      borderRadius: BorderRadius.circular(16)
    ),
    width: width,
    height: height,
  
    child: Center(
      child: buttonName,
    ),
  );
}