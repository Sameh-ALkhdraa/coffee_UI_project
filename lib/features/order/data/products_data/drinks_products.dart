import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/models/product_model/product.dart';
import 'package:mini_ui_project/core/models/product_model/product_info.dart';
import 'package:mini_ui_project/core/models/product_model/product_option.dart';

final List<Product> drinksProducts = [
  Product(
    title: "Cappuccino",
    subtitle: "Milk Coffee Drink",
    description:
        "Classic cappuccino with espresso, steamed milk and creamy foam.",
    rating: 4.9,
    imagePath: "assets/images/products_images/drinks_images/drink_1.png",
    info: const [
      ProductInfo(
        icon: Icons.local_cafe,
        text: "Hot Drink",
      ),
      ProductInfo(
        icon: Icons.water_drop, 
        text: "Milk",
      ),
      ProductInfo(
        text: "Espresso",
      ),
    ],
    options: [
      ProductOption(name: "S", price: 3.5),
      ProductOption(name: "M", price: 4.5),
      ProductOption(name: "L", price: 5.5),
    ],
  ),

  Product(
    title: "Iced Latte",
    subtitle: "Cold Coffee Drink",
    description:
        "Refreshing iced latte made with espresso and cold milk.",
    rating: 4.7,
    imagePath: "assets/images/products_images/drinks_images/drink_2.png",
    info: const [
      ProductInfo(
        icon: Icons.ac_unit,
        text: "Cold Drink",
      ),
      ProductInfo(
        icon: Icons.water_drop,
        text: "Milk",
      ),
      ProductInfo(
        text: "Espresso",
      ),
    ],
    options: [
      ProductOption(name: "S", price: 4.0),
      ProductOption(name: "M", price: 5.0),
      ProductOption(name: "L", price: 6.0),
    ],
  ),

  Product(
    title: "Caramel Macchiato",
    subtitle: "Sweet Espresso Drink",
    description:
        "Espresso with vanilla syrup, steamed milk and caramel drizzle.",
    rating: 4.8,
    imagePath: "assets/images/products_images/drinks_images/drink_1.png",
    info: const [
      ProductInfo(
        icon: Icons.local_cafe,
        text: "Hot Drink",
      ),
      ProductInfo(
        icon: Icons.cookie,
        text: "Caramel",
      ),
      ProductInfo(
        text: "Vanilla Syrup",
      ),
    ],
    options: [
      ProductOption(name: "S", price: 4.5),
      ProductOption(name: "M", price: 5.5),
      ProductOption(name: "L", price: 6.5),
    ],
  ),

  Product(
    title: "Mocha",
    subtitle: "Chocolate Coffee Drink",
    description:
        "Espresso blended with chocolate sauce and steamed milk.",
    rating: 4.9,
    imagePath: "assets/images/products_images/drinks_images/drink_2.png",
    info: const [
      ProductInfo(
        icon: Icons.local_cafe,
        text: "Hot Drink",
      ),
      ProductInfo(
        icon: Icons.cake,
        text: "Chocolate",
      ),
      ProductInfo(
        text: "Espresso",
      ),
    ],
    options: [
      ProductOption(name: "S", price: 4.2),
      ProductOption(name: "M", price: 5.2),
      ProductOption(name: "L", price: 6.2),
    ],
  ),

  Product(
    title: "Cold Brew",
    subtitle: "Slow Brewed Coffee",
    description:
        "Smooth cold brew coffee with naturally sweet flavor.",
    rating: 4.6,
    imagePath: "assets/images/products_images/drinks_images/drink_1.png",
    info: const [
      ProductInfo(
        icon: Icons.ac_unit,
        text: "Cold Drink",
      ),
      ProductInfo(
        icon: Icons.timer,
        text: "Slow Brewed",
      ),
      ProductInfo(
        text: "Smooth Flavor",
      ),
    ],
    options: [
      ProductOption(name: "S", price: 3.8),
      ProductOption(name: "M", price: 4.8),
      ProductOption(name: "L", price: 5.8),
    ],
  ),
];