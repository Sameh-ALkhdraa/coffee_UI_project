import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/routing/app_routes.dart';
import 'package:mini_ui_project/features/landing/widget/standard_image_logo.dart';
import 'package:mini_ui_project/features/landing/widget/standard_screen_style.dart';
import 'package:mini_ui_project/localization/l10n/app_localization.dart';
import 'package:mini_ui_project/core/widget/translate_text.dart';


class LandingScreen2 extends StatelessWidget {
Widget arabicShadda({
  double size = 40,
  Color color = Colors.black,
}) {
  return Text(
    'ّ',
    style: TextStyle(
      fontSize: size,
      color: color,
      height: 1,
    ),
  );
}

Widget specifiedText(BuildContext context){
  final t = AppLocalizations.of(context)!;
  return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 22,
          color: Colors.black,
        ),
        children: [
          translatedSpan(context, t.justOne),

          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                translatedText(context: context, text: t.sip, color: brown),

                Positioned(
                  top: -8,
                  left: -3,
                  child: arabicShadda(
                    size: 35,
                    color: mediumGreen,
                  ),
                ),
              ],
            ),
          ),

          translatedSpan(context, t.andFeelGood)
        ],
      ),
    );
}

Widget landingScreen2(BuildContext context){
  return standartLandingScreen(
    context: context,
    namedPage: AppRoutes.landingScreen3,
    coffeeDesign: standardImage("assets/images/secondLandingLogo.png"),
    landingDescribe: specifiedText(context), 
    stepperIndex: 1);
}


  const LandingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(child: landingScreen2(context));
  }
}