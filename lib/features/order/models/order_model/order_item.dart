import 'package:mini_ui_project/features/order/models/order_model/order_option.dart';

class OrderItem {
  String title;
  String imagePath;
  List<OrderOption> options;
  double totalPrice;

  OrderItem({
    required this.title,
    required this.imagePath,
    required this.options,
    required this.totalPrice,
  });
}