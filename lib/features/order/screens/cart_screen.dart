import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/icons/app_icons.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:mini_ui_project/core/models/product_model/product.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/routing/app_routes.dart';
import 'package:mini_ui_project/core/system_users/current_user.dart';
import 'package:mini_ui_project/core/widget/app_bar.dart';
import 'package:mini_ui_project/core/widget/custom_button.dart';
import 'package:mini_ui_project/features/order/widget/cart_widgets/cart_item_card.dart';
import 'package:mini_ui_project/features/order/data/cart_data/cart_item_list.dart';
import 'package:mini_ui_project/features/order/order_helper/adding_to_cart.dart';
import 'package:mini_ui_project/features/order/widget/price_text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double calculateTotalPrice() {
    double total = 0;

    for (final cartItem in cartItems) {
      for (final option in cartItem.selectedOptions) {
        total += option.option.price * option.quantity;
      }
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = calculateTotalPrice();
    return Scaffold(
      extendBody: true,
      appBar: StandardAppBar(
        title: context.t.cart,
        profileImage: currentUser!.image,
        leadingWidget: Icon(AppIcons.history,color: Colors.white,),
        onLeadingPressed: () {
          Navigator.pushNamed(context, AppRoutes.orderHistoryScreen);
        },
        onImagePressed: () {
          Navigator.pushNamed(context, AppRoutes.profileScreen);
        },
      ),
      body: Container(
        color: darkGreen,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  Product product = cartItems[index].product;
                  return Column(
                    children: [
                      CartItemCard(
                        cartItem: cartItems[index],
                        onAddPressed: (item) {
                          setState(() {
                            addToCart(product, item.option);
                          });
                        },

                        onDeletePressed: (item) {
                          setState(() {
                            if (item.quantity > 1) {
                              item.quantity--;
                            } else {
                              cartItems[index].selectedOptions.remove(item);

                              if (cartItems[index].selectedOptions.isEmpty) {
                                cartItems.removeAt(index);
                              }
                            }
                          });
                        },
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 95,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.t.totalPrice,
                    style: homeTextStyle.copyWith(color: cartTitle),
                  ),
                  PriceText(price: totalPrice),
                ],
              ),

              const Spacer(),

              InkWell(
                onTap: () {
                  if(cartItems.isNotEmpty){
                    Navigator.pushNamed(context, AppRoutes.paymentScreen, arguments: totalPrice);
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(context.t.noItemsInCart),
                      )
                    );
                  }
                },
                child: standardButtonDesign(
                  buttonName: Text(
                    context.t.pay,
                    style: homeTextStyle.copyWith(color: darkGreen),
                  ),
                  buttonColor: darkYellow,
                  width: 200,
                  height: 55,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
