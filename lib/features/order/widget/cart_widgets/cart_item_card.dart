import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/models/product_model/product.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/widget/edit_button.dart';
import 'package:mini_ui_project/features/order/models/cart_model/cart_item.dart';
import 'package:mini_ui_project/features/order/models/cart_model/cart_option.dart';
import 'package:mini_ui_project/features/order/widget/price_text.dart';

class CartItemCard extends StatefulWidget {
  final CartItem cartItem;
  final Function(CartOption option) onAddPressed;
  final Function(CartOption option) onDeletePressed;
  const CartItemCard({
    super.key,
    required this.cartItem,
    required this.onDeletePressed,
    required this.onAddPressed,
  });

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        child: isExpanded ? _expandedView() : _collapsedView(),
      ),
    );
  }

  Widget _collapsedView() {
    Product product = widget.cartItem.product;
    final option = widget.cartItem.selectedOptions.first;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: paymentColor,
        borderRadius: BorderRadius.circular(23),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 5),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.asset(product.imagePath),
          ),
          SizedBox(width: 5),
          Column(
            children: [
              Text(product.title, style: homeTextStyle),
              SizedBox(height: 12),
              Text(
                product.subtitle,
                style: homeTextStyle.copyWith(fontSize: 15),
              ),
              SizedBox(height: 12),
              _itemPriceAndSize(option: option),
              SizedBox(height: 20),
              SizedBox(width: 200, child: _editingQuantity(option: option)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _expandedView() {
    Product product = widget.cartItem.product;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: paymentColor,
        borderRadius: BorderRadius.circular(23),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(product.imagePath),
              ),
              SizedBox(width: 5),
              Column(
                children: [
                  Text(product.title, style: homeTextStyle),
                  SizedBox(height: 12),
                  Text(
                    product.subtitle,
                    style: homeTextStyle.copyWith(fontSize: 15),
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: cartItemInfoColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        product.info.first.text,
                        style: homeTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.cartItem.selectedOptions.length,
            itemBuilder: (context, index) {
              CartOption option = widget.cartItem.selectedOptions[index];
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _itemPriceAndSize(option: option),
                      _editingQuantity(option: option),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _editingQuantity({required CartOption option}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        EditButton(
          icon: Icons.remove,
          onPressed: () {
            setState(() {
              widget.onDeletePressed(option);
            });
          },
        ),
        SizedBox(height: 12, width: 12),
        Container(
          width: 100,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: darkGreen,
            border: Border.all(color: darkYellow, width: 2),
          ),
          child: Center(
            child: Text(option.quantity.toString(), style: homeTextStyle),
          ),
        ),
        SizedBox(height: 12, width: 12),
        EditButton(
          icon: Icons.add,
          onPressed: () {
            setState(() {
              widget.onAddPressed(option);
            });
          },
        ),
      ],
    );
  }

  Widget _itemPriceAndSize({required CartOption option}) {
    return Row(
      children: [
        Container(
          width: 84,
          height: 35,
          decoration: BoxDecoration(
            color: darkGreen,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text(option.option.name, style: homeTextStyle)),
        ),
        SizedBox(width: 5),
        PriceText(price: option.option.price * option.quantity),
      ],
    );
  }
}
