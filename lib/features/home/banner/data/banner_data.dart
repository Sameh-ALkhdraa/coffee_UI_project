import 'package:flutter/material.dart';
import 'package:mini_ui_project/features/home/banner/model/banner_model.dart';

final List<BannerModel> banners = [
  BannerModel(
    imagePath: "assets/images/banners_images/banner_1.png",
    leftWidget: const Text(
      "50% OFF",
      style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    ),
    rightWidget: const Text(
      "Only Today",
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),

  BannerModel(
    imagePath: "assets/images/banners_images/banner_1.png",
    leftWidget: const Text(
      "New Drinks",
      style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),

  BannerModel(
    imagePath: "assets/images/banners_images/banner_1.png",
  ),
];