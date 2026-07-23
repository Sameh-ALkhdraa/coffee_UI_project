import 'package:mini_ui_project/features/order/data/order_data/order_list.dart';
import 'package:mini_ui_project/features/order/models/order_model/order.dart';
import 'package:mini_ui_project/features/order/models/order_model/order_item.dart';
import 'package:mini_ui_project/features/order/models/order_model/order_option.dart';
import 'package:mini_ui_project/features/order/data/cart_data/cart_item_list.dart';

void saveOrderFromCart() {
  if (cartItems.isEmpty) return;

  List<OrderItem> orderItems = [];
  double orderTotal = 0;

  for (final cartItem in cartItems) {
    List<OrderOption> orderOptions = [];
    double itemTotal = 0;

    for (final cartOption in cartItem.selectedOptions) {
      final optionTotal =
          cartOption.option.price * cartOption.quantity;

      orderOptions.add(
        OrderOption(
          size: cartOption.option.name,
          unitPrice: cartOption.option.price,
          quantity: cartOption.quantity,
          totalPrice: optionTotal,
        ),
      );

      itemTotal += optionTotal;
    }

    orderItems.add(
      OrderItem(
        title: cartItem.product.title,
        imagePath: cartItem.product.imagePath,
        options: orderOptions,
        totalPrice: itemTotal,
      ),
    );

    orderTotal += itemTotal;
  }

  ordersList.add(
    Order(
      items: orderItems,
      totalPrice: orderTotal,
      orderDate: DateTime.now(),
    ),
  );
  cartItems.clear();
}