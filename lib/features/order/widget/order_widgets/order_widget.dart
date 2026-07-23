import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/features/order/models/order_model/order.dart';
import 'package:mini_ui_project/features/order/models/order_model/order_item.dart';
import 'package:mini_ui_project/features/order/models/order_model/order_option.dart';
import 'package:mini_ui_project/features/order/widget/price_text.dart';


Widget orderOptionRow({
  required OrderOption option,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        width: 80,
        height: 30,
        decoration: BoxDecoration(
          color: darkGreen,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            option.size,
            style: homeTextStyle,
          ),
        ),
      ),

      PriceText(price: option.unitPrice),

      Text(
        "${option.quantity}x",
        style: homeTextStyle,
      ),

      Text(
        option.totalPrice.toStringAsFixed(2),
        style: homeTextStyle,
      ),
    ],
  );
}

Widget orderOptionsList({
  required List<OrderOption> options,
}) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: options.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: orderOptionRow(
          option: options[index],
        ),
      );
    },
  );
}

Widget orderItemWidget({
  required OrderItem item,
}) {
  return Container(
    decoration: BoxDecoration(
      color: paymentColor,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Theme(
      data: ThemeData().copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.all(12),
        childrenPadding: const EdgeInsets.only(
          left: 12,
          right: 12,
          bottom: 12,
        ),
        collapsedIconColor: Colors.white,
        iconColor: darkYellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),

        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                item.imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: homeTextStyle,
                  ),

                  const SizedBox(height: 8),

                  PriceText(
                    price: item.totalPrice,
                  ),
                ],
              ),
            ),
          ],
        ),

        children: [
          orderOptionsList(
            options: item.options,
          ),
        ],
      ),
    ),
  );
}

Widget orderWidget({
  required Order order,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            "${order.orderDate.year}/${order.orderDate.month}/${order.orderDate.day}  ${order.orderDate.hour}:${order.orderDate.minute}:${order.orderDate.second}",
            style: homeTextStyle,
          ),

          const Spacer(),

          PriceText(
            price: order.totalPrice,
          ),
        ],
      ),

      const SizedBox(height: 20),

      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: order.items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: orderItemWidget(
              item: order.items[index],
            ),
          );
        },
      ),
    ],
  );
}



