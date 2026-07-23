import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/routing/app_routes.dart';
import 'package:mini_ui_project/core/widget/arrow_back.dart';
import 'package:mini_ui_project/core/widget/custom_button.dart';
import 'package:mini_ui_project/features/order/order_helper/save_order.dart';
import 'package:mini_ui_project/features/order/data/payment_data/payment_method_list.dart';
import 'package:mini_ui_project/features/order/widget/payment_widgets/payment_card.dart';
import 'package:mini_ui_project/features/order/widget/payment_widgets/payment_method_tile.dart';

class PaymentScreen extends StatefulWidget {
  final double price;
  const PaymentScreen({super.key, required this.price});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: darkGreen,
        centerTitle: true,
        leading: ArrowBack(),
        title: Text(context.t.payment, style: homeTextStyle),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(color: darkGreen),
        child: Column(
          children: [
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: paymentMethods.length,
              itemBuilder: (context, index) {
                final method = paymentMethods[index];

                if (method.isCard) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: selectedIndex == 0
                              ? darkYellow
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(paymentMethods[0].name, style: homeTextStyle),
                            PaymentCard(),
                          ],
                        ),
                      ),
                    ),
                  );
                }

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index + 1;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 12,
                      left: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: selectedIndex == index + 1
                            ? darkYellow
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: paymentMethodTile(
                      icon: method.icon!,
                      title: method.name,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 90,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(color: darkGreen),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.t.price,
                    style: homeTextStyle.copyWith(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),

                  Text(
                    "\$${widget.price.toStringAsFixed(2)}",
                    style: homeTextStyle.copyWith(fontSize: 22),
                  ),
                ],
              ),

              const Spacer(),

              InkWell(
                onTap: () async {
                  saveOrderFromCart();

                  final controller = ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(context.t.orderSuccess),
                    ),
                  );

                  await controller.closed;

                  if (context.mounted) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.mainLayoutsScreen,
                      (route) => false,
                    );
                  }
                },
                child: standardButtonDesign(
                  buttonColor: darkYellow,
                  width: 220,
                  height: 55,
                  buttonName: Text(
                    selectedIndex == 0
                        ? "${context.t.payFrom} ${context.t.creditCard}"
                        : "${context.t.payFrom} ${paymentMethods[selectedIndex - 1].name}",
                    style: homeTextStyle.copyWith(color: darkGreen),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
