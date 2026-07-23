import 'package:flutter/material.dart';
import 'package:mini_ui_project/features/home/widgets/product_widgets/product_card.dart';
import 'package:mini_ui_project/core/models/product_model/product.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 220,
            child: ProductCard(
              product: products[index],
            ),
          );
        },
      ),
    );
  }
}