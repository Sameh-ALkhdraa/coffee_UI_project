import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/models/product_model/product.dart';

class ProductDetailsContent extends StatelessWidget {
  final Product product;
  final VoidCallback onFavoritePressed;
  final bool isFavorite;
  const ProductDetailsContent({
    super.key,
    required this.product,
    required this.onFavoritePressed, 
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                product.imagePath,
                width: double.infinity,
                height: 420,
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              top: 18,
              right: 18,
              child: InkWell( 
                onTap: onFavoritePressed,
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: const BoxDecoration(
                    color: Color(0xff21262E),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: isFavorite ? Colors.red : Colors.white,
                  ),
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.45),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// LEFT SIDE
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            product.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            product.subtitle,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(height: 12),

                          Row(
                            children: [

                              const Icon(
                                Icons.star,
                                color: darkYellow,
                                size: 18,
                              ),

                              const SizedBox(width: 6),

                              Text(
                                product.rating.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 20),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (product.info.length > 1)
                        _productInfoChip(product.info[1]),
                        
                        const SizedBox(height: 10, width: 5,),
                        
                        if (product.info.length > 2)
                          _productInfoChip(product.info[2]),
                      const SizedBox(height: 5, width: 5,),

                      if (product.info.isNotEmpty)
                        _productInfoChip(product.info.first),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          
 
          ],
        ),



        const SizedBox(height: 24),

        
      ],
    );
  }

  Widget _productInfoChip(dynamic info) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: productInfoColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (info.icon != null) ...[
            Icon(
              info.icon,
              color: darkYellow,
              size: 16,
            ),
            const SizedBox(width: 6),
          ],

          Text(
            info.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}