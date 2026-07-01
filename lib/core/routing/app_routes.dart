import 'package:flutter/material.dart';
import 'package:mini_ui_project/features/auth/screens/admin_auth/admin_data_screen.dart';
import 'package:mini_ui_project/features/auth/screens/user_auth/user_auth_screens/login_screen.dart';
import 'package:mini_ui_project/features/auth/screens/user_auth/user_auth_screens/register_screen.dart';
import 'package:mini_ui_project/features/landing/landing_Screens/landing_screen2.dart';
import 'package:mini_ui_project/features/landing/landing_Screens/landing_screen3.dart';

abstract class AppRoutes {
  static const String loginScreen = "/";
  static const String registerScreen = "/register";
  static const String mainLayoutsScreen = "/mainLayouts";
  static const String adminDataScreen = "/adminData";
  static const String landingScreen2 = "/landingScreen2";
  static const String landingScreen3 = "/landingScreen3";
}

Route<dynamic>? onGenerateRoute(RouteSettings settings){
    final arguments = settings.arguments;
    switch(settings.name){
      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.adminDataScreen:
         final args = arguments as String;
        return MaterialPageRoute(builder: (_) => AdminDataScreen(username: args,));
      case AppRoutes.registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case AppRoutes.landingScreen2:
        return MaterialPageRoute(builder: (_) => LandingScreen2());
      case AppRoutes.landingScreen3:
        return MaterialPageRoute(builder: (_) => LandingScreen3());
      default:
        return MaterialPageRoute(builder: (_) => Container(child: Center(child: Text("Not Found")),));
    }
  }