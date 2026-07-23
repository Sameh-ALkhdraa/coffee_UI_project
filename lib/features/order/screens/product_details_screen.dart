import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/widget/arrow_back.dart';
import 'package:mini_ui_project/core/widget/custom_button.dart';
import 'package:mini_ui_project/features/favourite/favourite_list.dart';
import 'package:mini_ui_project/features/order/order_helper/adding_to_cart.dart';
import 'package:mini_ui_project/core/widget/product_widgets/description_product.dart';
import 'package:mini_ui_project/core/models/product_model/product.dart';
import 'package:mini_ui_project/core/widget/product_widgets/product_details_content.dart';
import 'package:mini_ui_project/features/order/widget/price_text.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  int selectedSize = 0;
  @override
  Widget build(BuildContext context) {

    final option = widget.product.options[selectedSize];

    return Scaffold(
      backgroundColor: darkGreen,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Stack(
                children: [
                  ProductDetailsContent(
                      product: widget.product,
                      isFavorite: favouriteProducts.contains(widget.product),
                      onFavoritePressed: () {
                        setState(() {
                          if (favouriteProducts.contains(widget.product)) {
                            favouriteProducts.remove(widget.product);
                          } else {
                            favouriteProducts.add(widget.product);
                          }
                        });
                      },
                  ),
                  Positioned(
                    top: 18,
                    left: 18,
                    child: ArrowBack()
                  ),
                ],
              ),

              const SizedBox(height: 28),

              DescriptionProduct(product: widget.product),
              
              const SizedBox(height: 28),
              Text(
                context.t.size,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),

              Row(
                children: List.generate(
                  widget.product.options.length,
                  (index) {

                    final bool selected = selectedSize == index;

                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 10
                        ),

                        child: InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () {
                            setState(() {
                              selectedSize = index;
                            }); 
                          },

                          child: Container(
                            height: 55,

                            decoration: BoxDecoration(
                              color: selected
                                  ? darkYellow
                                  : productInfoColor,

                              borderRadius: BorderRadius.circular(15),
                            ),

                            child: Center(
                              child: Text(
                                widget.product.options[index].name,
                                style: TextStyle(
                                  color: selected
                                      ? darkGreen
                                      : Colors.white,

                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 35),


              Text(
                context.t.price,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),

              const SizedBox(height: 15),

              Row(
                children: [

                  PriceText(price: option.price),

                  const Spacer(),
                  InkWell(
                    onTap: () {
                      addToCart(
                        widget.product,
                        widget.product.options[selectedSize],
                      );
                    },
                    child: standardButtonDesign(
                      buttonName: Text(context.t.addToCart, style: homeTextStyle.copyWith(color: darkGreen),),
                      buttonColor: darkYellow,
                      width: 240,
                      height: 60,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  
}