import 'package:flutter/material.dart';

class PaymentMethod {
  IconData? icon;
  String name;
  bool isCard;

  PaymentMethod({
    this.icon,
    required this.name,
    this.isCard = false,
  });
}