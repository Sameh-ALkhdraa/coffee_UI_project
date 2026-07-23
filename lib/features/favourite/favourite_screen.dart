import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/icons/app_icons.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/routing/app_routes.dart';
import 'package:mini_ui_project/core/system_users/current_user.dart';
import 'package:mini_ui_project/core/widget/app_bar.dart';
import 'package:mini_ui_project/features/favourite/favourite_list.dart';
import 'package:mini_ui_project/core/widget/product_widgets/description_product.dart';
import 'package:mini_ui_project/core/models/product_model/product.dart';
import 'package:mini_ui_project/core/widget/product_widgets/product_details_content.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Product> products = favouriteProducts.toList();

    return Scaffold(
      backgroundColor: darkGreen,
      appBar: StandardAppBar(
        title: context.t.favourite,
        profileImage: currentUser!.image,
        leadingWidget: Icon(AppIcons.history, color: Colors.white,),
        onLeadingPressed: () {
          Navigator.pushNamed(context, AppRoutes.orderHistoryScreen);
        },
        onImagePressed: () {
          Navigator.pushNamed(context, AppRoutes.profileScreen);
        },
      ),
      body: favouriteProducts.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.favorite,
                    size: 110,
                    color: productInfoColor,
                  ),
                  SizedBox(height: 15),
                  Text(
                    context.t.noFavouriteProducts,
                    style: TextStyle(
                      color: productInfoColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          : Container(
            color: darkGreen,
            child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 100),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        ProductDetailsContent(
                          product: product,
                          isFavorite: true,
                          onFavoritePressed: () {
                            setState(() {
                                favouriteProducts.remove(product);
                            });
                          },
                        ),
                        SizedBox(height: 15,),
                        DescriptionProduct(product: product)
                      ],
                    ),
                  );
                },
              ),
          ),
            
    );
  }
}