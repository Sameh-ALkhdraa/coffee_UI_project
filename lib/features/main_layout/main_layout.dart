import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/features/order/screens/cart_screen.dart';
import 'package:mini_ui_project/features/discount/discount_screen.dart';
import 'package:mini_ui_project/features/favourite/favourite_screen.dart';
import 'package:mini_ui_project/features/home/home_screen.dart';


class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
    int currentIndex = 0;
 
    
    
    List<Widget> screens = [
      HomeScreen(),
      CartScreen(),
      FavouriteScreen(),
      DiscountScreen()
    ];
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],
      bottomNavigationBar: 
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: GlassmorphicContainer(
          width: double.infinity,
          height: 75,
          borderRadius: 25,
          blur: 20,
          alignment: Alignment.center,
          border: 1.5,
          linearGradient: LinearGradient(
            colors: [
              Colors.white.withValues(alpha: 0.25),
              Colors.white.withValues(alpha: 0.08),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderGradient: LinearGradient(
            colors: [
              Colors.white.withValues(alpha: 0.5),
              Colors.white.withValues(alpha: 0.1),
            ],
          ),
          child: BottomNavigationBar(
            
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
    
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
    
    
    
            selectedItemColor: darkYellow,
            unselectedItemColor: bottomNaviagtionBarcolor,
    
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_rounded),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_rounded),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.discount_rounded),
                label: "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}