import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/widget/search_textbox_design.dart';
import 'package:mini_ui_project/features/home/banner/data/banner_data.dart';
import 'package:mini_ui_project/features/home/widgets/banner_widgets/banner_list.dart';
import 'package:mini_ui_project/features/home/widgets/product_widgets/product_list.dart';
import 'package:mini_ui_project/features/order/data/products_data/beans_products.dart';
import 'package:mini_ui_project/features/order/data/products_data/drinks_products.dart';
import 'package:mini_ui_project/core/models/product_model/product.dart';
import 'package:mini_ui_project/core/system_users/current_user.dart';
import 'package:mini_ui_project/core/widget/beans_counter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
void searchProducts(String query) {
  setState(() {
    if (query.trim().isEmpty) {
      filteredBeansProducts = List.from(beansProducts);
      filteredDrinksProducts = List.from(drinksProducts);
      return;
    }

    final search = query.toLowerCase();

    filteredBeansProducts = beansProducts.where((product) {
      return product.title.toLowerCase().contains(search);
    }).toList();

    filteredDrinksProducts = drinksProducts.where((product) {
      return product.title.toLowerCase().contains(search);
    }).toList();
  });
}
@override
void initState() {
  super.initState();

  filteredBeansProducts = List.from(beansProducts);
  filteredDrinksProducts = List.from(drinksProducts);
}
  int selectedIndex = 0;

  final TextEditingController searchController = TextEditingController();
  List<Product> filteredBeansProducts = [];
  List<Product> filteredDrinksProducts = [];
  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      context.t.all,
      context.t.cappuccino,
      context.t.espresso,
      context.t.americano,
      context.t.macchiato,
    ];
    return Material(
      color: darkGreen,
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(context.t.bestCoffeeForYou, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),),
                  Container(
                    width: 90,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: gradient
                    ),
                    child: BeansCounter(beans: currentUser!.numberOfBeans)
                  )
                ],
              ),
              SizedBox(height: 20,),
              searchField(
                controller: searchController, 
                onChanged: (value) {
                  searchProducts(value);
                },
                hintText: context.t.findYourCoffee, 
                leadingIcon: Icons.search, 
                color: Color(0xFF0F1C1B),
                
              ),
              
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
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
                              categories[index],
                              style: TextStyle(
                                color: isSelected
                                    ? darkYellow
                                    : Colors.grey,
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
              
              SizedBox(height: 20,),
              BannerList(banners: banners),
              SizedBox(height: 20,),
              Text(context.t.coffeeBeans, style: homeTextStyle,),
              SizedBox(height: 20,),
              ProductList(products: filteredBeansProducts),
              Text(context.t.cappuccino, style: homeTextStyle,),
              SizedBox(height: 20,),
              ProductList(products: filteredDrinksProducts),
              
            ],
          ),
        ),
      ),
    );
  }
}