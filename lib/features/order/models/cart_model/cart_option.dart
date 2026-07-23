import 'package:mini_ui_project/core/models/product_model/product_option.dart';

class CartOption {
  ProductOption option;
  int quantity;

  CartOption({
    required this.option,
    this.quantity = 1,
  });
}