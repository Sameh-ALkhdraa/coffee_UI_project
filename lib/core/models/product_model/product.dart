import 'package:mini_ui_project/core/models/product_model/product_info.dart';
import 'package:mini_ui_project/core/models/product_model/product_option.dart';

class Product {
  final String title;
  final String subtitle;
  final String description;
  final double rating;
  /// مثل: Medium Roasted أو Colombia
  final List<ProductInfo> info;
  final String imagePath;
  /// الأحجام أو الأوزان مع أسعارها
  final List<ProductOption> options;
  const Product({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.rating,
    required this.info,
    required this.options,
    required this.imagePath
  });
  
}