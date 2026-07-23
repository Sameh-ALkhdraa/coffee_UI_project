import 'package:flutter/material.dart';

class BannerModel {
  final String imagePath;
  final Widget? leftWidget;
  final Widget? rightWidget;

  const BannerModel({
    required this.imagePath,
    this.leftWidget,
    this.rightWidget,
  });
}