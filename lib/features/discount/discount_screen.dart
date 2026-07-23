import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/features/discount/components/discount_card.dart';
import 'package:mini_ui_project/features/discount/components/user_profile_card.dart';
import 'package:mini_ui_project/features/discount/data/offers_list.dart';

class DiscountScreen extends StatelessWidget {
  const DiscountScreen({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Material(
        color: darkGreen,
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(context.t.bestCoffeeForYou, style:homeTextStyle.copyWith(fontWeight: FontWeight.w600),),
              SizedBox(height: 30,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: UserProfileCard()
              ),
              SizedBox(height: 25,),
              Row(
                children: [
                  Icon(Icons.discount_outlined, color: Colors.white,),
                  SizedBox(width: 5,),
                  Text(context.t.cubons, style: homeTextStyle,)
                ],
              ),
              SizedBox(height: 25,),
              ListView.builder(
                shrinkWrap: true,
                itemCount: offers.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: DiscountCard(
                          title: offers[index].title,
                          imagePath: offers[index].imagePath,
                        ),
                      ),
                      SizedBox(height: 15,),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}