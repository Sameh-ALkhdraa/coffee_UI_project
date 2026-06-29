import 'package:flutter/material.dart';

Widget standardImage(String imagePath){
  return SizedBox(
    width: 400,
    height: 400,
    child: Image.asset(imagePath, fit: BoxFit.fill,)
  );
}