import 'package:mini_ui_project/features/order/models/order_model/order_item.dart';

class Order {
  List<OrderItem> items;
  double totalPrice;
  DateTime orderDate;

  Order({
    required this.items,
    required this.totalPrice,
    required this.orderDate,
  });
}