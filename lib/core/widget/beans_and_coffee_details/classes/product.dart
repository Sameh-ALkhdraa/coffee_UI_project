import 'package:mini_ui_project/core/widget/beans_and_coffee_details/classes/product_info.dart';
import 'package:mini_ui_project/core/widget/beans_and_coffee_details/classes/product_option.dart';

class Product {
  final String title;
  final String subtitle;
  final String description;
  final double price;
  final double rating;

  /// مثل: Medium Roasted أو Colombia
  final ProductInfo info;

  /// الأحجام أو الأوزان مع أسعارها
  final List<ProductOption> options;

  final String imagePath;
  const Product({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.price,
    required this.rating,
    required this.info,
    required this.options,
    required this.imagePath
  });
}