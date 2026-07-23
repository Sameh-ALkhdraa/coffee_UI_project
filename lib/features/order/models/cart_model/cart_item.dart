import 'package:mini_ui_project/core/models/product_model/product.dart';
import 'package:mini_ui_project/features/order/models/cart_model/cart_option.dart';

class CartItem {
  Product product;
  List<CartOption> selectedOptions;

  CartItem({
    required this.product,
    required this.selectedOptions,
  });
}