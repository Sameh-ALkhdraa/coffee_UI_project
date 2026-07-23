import 'package:mini_ui_project/core/models/product_model/product.dart';
import 'package:mini_ui_project/core/models/product_model/product_option.dart';
import 'package:mini_ui_project/features/order/data/cart_data/cart_item_list.dart';
import 'package:mini_ui_project/features/order/models/cart_model/cart_item.dart';
import 'package:mini_ui_project/features/order/models/cart_model/cart_option.dart';

void addToCart(Product product, ProductOption option) {

  // هل المنتج موجود؟
  CartItem? cartItem;

  try {
    cartItem = cartItems.firstWhere(
      (item) => item.product == product,
    );
  } catch (_) {
    cartItem = null;
  }


  // إذا المنتج غير موجود
  if (cartItem == null) {
    CartOption cartOption = CartOption(
      option: option,
      quantity: 1
    );
    CartItem newItem = CartItem(
      product: product,
      selectedOptions: [cartOption]
    );

    cartItems.add(newItem);
    return;
  }

  // المنتج موجود، هل الحجم موجود؟
  try {
    CartOption selected = cartItem.selectedOptions.firstWhere(
      (e) => e.option == option,
    );

    selected.quantity++;
  } catch (_) {
    CartOption newOption = CartOption(
      option: option,
      quantity: 1
    );

    cartItem.selectedOptions.add(newOption);
  }
}
