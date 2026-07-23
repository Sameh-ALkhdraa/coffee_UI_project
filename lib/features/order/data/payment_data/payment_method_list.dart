import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/icons/app_icons.dart';
import 'package:mini_ui_project/features/order/models/payment_model/payment_method.dart';

final List<PaymentMethod> paymentMethods = [
  PaymentMethod(
    name: "Credit Card",
    isCard: true,
  ),

  PaymentMethod(
    icon: AppIcons.wallet,
    name: "Wallet",
  ),

  PaymentMethod(
    icon: Icons.g_mobiledata_rounded,
    name: "Google Pay",
  ),

  PaymentMethod(
    icon: Icons.apple,
    name: "Apple Pay",
  ),

  PaymentMethod(
    icon: Icons.shopping_bag_outlined,
    name: "Amazon Pay",
  ),
];