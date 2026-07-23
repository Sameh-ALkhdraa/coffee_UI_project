import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/models/product_model/product.dart';
import 'package:mini_ui_project/core/models/product_model/product_info.dart';
import 'package:mini_ui_project/core/models/product_model/product_option.dart';

final List<Product> beansProducts = [
  Product(
    title: "Colombia Coffee Beans",
    subtitle: "Premium Arabica Beans",
    description:
        "High quality Colombian coffee beans with balanced flavor and sweet notes.",
    rating: 4.8,
    imagePath: "assets/images/products_images/beans_images/beans_1.png",
    info: const [
      ProductInfo(
        icon: Icons.local_fire_department,
        text: "Medium Roasted",
      ),
      ProductInfo(
        icon: Icons.public,
        text: "Colombia",
      ),
      ProductInfo(
        text: "Arabica",
      ),
    ],
    options: [
      ProductOption(name: "250g", price: 8.5),
      ProductOption(name: "500g", price: 15.0),
      ProductOption(name: "1kg", price: 28.0),
    ],
  ),

  Product(
    title: "Brazil Coffee Beans",
    subtitle: "Classic Espresso Blend",
    description:
        "Rich Brazilian beans with chocolate flavor and smooth finish.",
    rating: 4.6,
    imagePath: "assets/images/products_images/beans_images/beans_2.png",
    info: const [
      ProductInfo(
        icon: Icons.local_fire_department,
        text: "Dark Roasted",
      ),
      ProductInfo(
        icon: Icons.public,
        text: "Brazil",
      ),
      ProductInfo(
        text: "Espresso Blend",
      ),
    ],
    options: [
      ProductOption(name: "250g", price: 9.0),
      ProductOption(name: "500g", price: 16.5),
      ProductOption(name: "1kg", price: 30.0),
    ],
  ),

  Product(
    title: "Ethiopian Coffee Beans",
    subtitle: "Single Origin Beans",
    description:
        "Fruity Ethiopian coffee beans with floral aroma and bright acidity.",
    rating: 4.9,
    imagePath: "assets/images/products_images/beans_images/beans_1.png",
    info: const [
      ProductInfo(
        icon: Icons.local_fire_department,
        text: "Light Roasted",
      ),
      ProductInfo(
        icon: Icons.public,
        text: "Ethiopia",
      ),
      ProductInfo(
        text: "Single Origin",
      ),
    ],
    options: [
      ProductOption(name: "250g", price: 10.0),
      ProductOption(name: "500g", price: 18.5),
      ProductOption(name: "1kg", price: 34.0),
    ],
  ),

  Product(
    title: "Guatemala Coffee Beans",
    subtitle: "Balanced Roast",
    description:
        "Smooth Guatemalan beans with cocoa flavor and nutty finish.",
    rating: 4.7,
    imagePath: "assets/images/products_images/beans_images/beans_2.png",
    info: const [
      ProductInfo(
        icon: Icons.local_fire_department,
        text: "Medium Roasted",
      ),
      ProductInfo(
        icon: Icons.public,
        text: "Guatemala",
      ),
      ProductInfo(
        text: "Nutty Flavor",
      ),
    ],
    options: [
      ProductOption(name: "250g", price: 9.5),
      ProductOption(name: "500g", price: 17.5),
      ProductOption(name: "1kg", price: 32.0),
    ],
  ),

  Product(
    title: "House Blend Beans",
    subtitle: "Signature Coffee Blend",
    description:
        "Our signature blend combining rich aroma with smooth taste.",
    rating: 4.8,
    imagePath: "assets/images/products_images/beans_images/beans_1.png",
    info: const [
      ProductInfo(
        icon: Icons.local_fire_department,
        text: "Dark Roasted",
      ),
      ProductInfo(
        icon: Icons.coffee,
        text: "House Blend",
      ),
      ProductInfo(
        text: "Smooth Taste",
      ),
    ],
    options: [
      ProductOption(name: "250g", price: 8.8),
      ProductOption(name: "500g", price: 16.0),
      ProductOption(name: "1kg", price: 29.5),
    ],
  ),
];