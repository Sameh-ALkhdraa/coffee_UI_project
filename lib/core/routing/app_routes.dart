import 'package:flutter/material.dart';
import 'package:mini_ui_project/features/auth/screens/admin_auth/admin_data_screen.dart';
import 'package:mini_ui_project/features/auth/screens/admin_auth/admin_login_screen.dart';
import 'package:mini_ui_project/features/auth/screens/user_auth_screens/login_screen.dart';
import 'package:mini_ui_project/features/auth/screens/user_auth_screens/register_screen.dart';
import 'package:mini_ui_project/features/landing/landing_Screens/landing_screen1.dart';
import 'package:mini_ui_project/features/landing/landing_Screens/landing_screen2.dart';
import 'package:mini_ui_project/features/landing/landing_Screens/landing_screen3.dart';
import 'package:mini_ui_project/features/main_layout/main_layout.dart';
import 'package:mini_ui_project/core/models/product_model/product.dart';
import 'package:mini_ui_project/features/order/screens/order_history_screen.dart';
import 'package:mini_ui_project/features/order/screens/payment_screen.dart';
import 'package:mini_ui_project/features/order/screens/product_details_screen.dart';
import 'package:mini_ui_project/features/profile/profile_screen.dart';

abstract class AppRoutes {
  static const String loginScreen = "/";
  static const String registerScreen = "/register";
  static const String mainLayoutsScreen = "/mainLayouts";
  static const String adminDataScreen = "/adminData";
  static const String adminLoginScreen = "/adminlogin";
  static const String profileScreen = "/profile";
  static const String productScreen = "/product";
  static const String paymentScreen = "/payment";
  static const String orderHistoryScreen = "/orderHistory";
  static const String landingScreen1 = "/landingScreen1";
  static const String landingScreen2 = "/landingScreen2";
  static const String landingScreen3 = "/landingScreen3";
}

Route<dynamic>? onGenerateRoute(RouteSettings settings){
    final arguments = settings.arguments;
    switch(settings.name){
      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.mainLayoutsScreen:
        return MaterialPageRoute(builder: (_) => MainLayout());
      case AppRoutes.profileScreen:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case AppRoutes.orderHistoryScreen:
        return MaterialPageRoute(builder: (_) => OrderHistoryScreen());
      case AppRoutes.paymentScreen:
        final args = arguments as double;
        return MaterialPageRoute(builder: (_) => PaymentScreen(price: args,));
      case AppRoutes.productScreen:
        final args = arguments as Product;
        return MaterialPageRoute(builder: (_) => ProductDetailsScreen(product: args,));
      case AppRoutes.adminLoginScreen:
        return MaterialPageRoute(builder: (_) => AdminLoginScreen());
      case AppRoutes.adminDataScreen:
         final args = arguments as String;
        return MaterialPageRoute(builder: (_) => AdminDataScreen(username: args,));
      case AppRoutes.registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case AppRoutes.landingScreen1:
        return MaterialPageRoute(builder: (_) => LandingScreen1());
      case AppRoutes.landingScreen2:
        return MaterialPageRoute(builder: (_) => LandingScreen2());
      case AppRoutes.landingScreen3:
        return MaterialPageRoute(builder: (_) => LandingScreen3());
      default:
        return MaterialPageRoute(builder: (_) => Center(child: Text("Not Found")));
    }
  }