import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/routing/app_routes.dart';
import 'package:mini_ui_project/core/widget/edit_button.dart';
import 'package:mini_ui_project/core/models/product_model/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: darkGreen,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.productScreen, arguments: widget.product);
        },
        child: Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 10,
          ),
          color: darkGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
        
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    widget.product.imagePath,
                    width: double.infinity,
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                ),
        
                const SizedBox(height: 10),
        
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  widget.product.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        
                const SizedBox(height: 5),
        
                Text(
                  widget.product.info.first.text,
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),
        
                const SizedBox(height: 12),
        
                Row(
                  children: [
        
                    const Text(
                      "\$",
                      style: TextStyle(
                        color: darkYellow,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
        
                    const SizedBox(width: 5),
        
                    Text(
                      widget.product.options.first.price.toStringAsFixed(2),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
        
                    const Spacer(),
        
                    EditButton(
                      icon: Icons.add,
                      onPressed: () {
                        setState(() {
                          widget.product.options.first.price += 0.01;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}