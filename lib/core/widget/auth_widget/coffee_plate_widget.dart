import 'package:flutter/material.dart';

Widget coffee({
  required String imagePath, 
  required Color plateColor, 
  required double imageWidth, 
  required double imageHeight
}){
  return Container(
    decoration: BoxDecoration(
      color: plateColor,
      shape: BoxShape.circle
    ),

    child: Image.asset(imagePath, width: imageWidth, height: imageHeight,),
  );
}

