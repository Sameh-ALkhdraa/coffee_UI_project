import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/routing/app_routes.dart';
import 'package:mini_ui_project/features/auth/screens/admin_auth/admin_login_screen.dart';
import 'package:mini_ui_project/features/auth/screens/user_auth/user_auth_screens/login_screen.dart';
import 'package:mini_ui_project/features/landing/landing_Screens/landing_screen1.dart';
import 'package:mini_ui_project/localization/l10n/app_localization.dart';

// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:glassmorphism/glassmorphism.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: Locale("ar"),

      supportedLocales: [
        Locale("en"),
        Locale("ar"),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],

      onGenerateRoute: onGenerateRoute,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: lightYellow,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              LandingScreen1(),
              // LoginScreen()
              // AdminLoginScreen()
          ],
        ),
      )
    );
  }
}
