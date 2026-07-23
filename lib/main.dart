import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mini_ui_project/core/config/app_config.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/routing/app_routes.dart';
import 'package:mini_ui_project/localization/l10n/app_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // لتهيئة المعلومات قبل تشغيل التطبيق

  AppConfig appConfig = AppConfig();
  await appConfig
      .init(); // لان تابع التهئية بداخله انتظار ف يجب انتظاره ايضا هنا
  
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider.value(value: appConfig)], // بالعادة منستخدم انشاء لكن هنا انا انشئت الاعدادات وقمت بعمل تهيئة لها فقط انت استخدمها
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppConfig>(
      builder: (context, value, child) {
        return MaterialApp(
          theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          locale: Locale(value.selectedLanguage),
          supportedLocales: [Locale("en"), Locale("ar")],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        
          onGenerateRoute: onGenerateRoute,
          initialRoute: 
          // AppRoutes.adminLoginScreen
          value.isFirstTime ? AppRoutes.landingScreen1 : AppRoutes.loginScreen,
        );
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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
            // LandingScreen1(),
            // LoginScreen()
            // AdminLoginScreen()
          ],
        ),
      ),
    );
  }
}
