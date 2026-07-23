import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/routing/app_routes.dart';
import 'package:mini_ui_project/core/system_users/current_user.dart';
import 'package:mini_ui_project/core/widget/app_bar.dart';
import 'package:mini_ui_project/core/widget/arrow_back.dart';
import 'package:mini_ui_project/core/widget/custom_button.dart';
import 'package:mini_ui_project/features/order/data/order_data/order_list.dart';
import 'package:mini_ui_project/features/order/widget/order_widgets/order_widget.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistoryScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> orderState = [
      context.t.all,
      context.t.delivery,
      context.t.inHouse,
      context.t.canceled,
    ];
    return Scaffold(
      extendBody: true,
      appBar: StandardAppBar(
        title: context.t.orderHistory,
        leadingWidget: ArrowBack(),
        profileImage: currentUser!.image,
        onImagePressed: () {
          Navigator.pushNamed(context, AppRoutes.profileScreen);
        },
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(color: darkGreen),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                margin: EdgeInsets.only(top: 20, left: 50, right: 20),
                child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: orderState.length,
                    itemBuilder: (context, index) {
                      final isSelected = selectedIndex == index;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: Column(
                            children: [
                              Text(
                                orderState[index],
                                style: TextStyle(
                                  color: isSelected ? darkYellow : Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? darkYellow
                                      : Colors.transparent,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              ordersList.isEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              size: 110,
                              color: Colors.white.withValues(alpha: 0.7),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              context.t.noOrdersYet,
                              style: homeTextStyle.copyWith(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              context.t.startShoppingToSeeOrders,
                              textAlign: TextAlign.center,
                              style: homeTextStyle.copyWith(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: ordersList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: orderWidget(
                            order: ordersList[ordersList.length - index - 1],
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        child: standardButtonDesign(
          buttonName: Center(
            child: Text(
              context.t.download,
              style: homeTextStyle.copyWith(color: darkGreen),
            ),
          ),
          buttonColor: darkYellow,
          width: 330,
          height: 60,
        ),
      ),
    );
  }
}
