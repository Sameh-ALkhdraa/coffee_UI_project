import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/routing/app_routes.dart';
import 'package:mini_ui_project/core/widget/translate_text.dart';
import 'package:mini_ui_project/features/landing/widget/standard_image_logo.dart';
import 'package:mini_ui_project/features/landing/widget/standard_screen_style.dart';
import 'package:mini_ui_project/localization/l10n/app_localization.dart';



class LandingScreen3 extends StatelessWidget {

  Widget specifiedText(BuildContext context){
  final isArabic =
      Localizations.localeOf(context).languageCode == 'ar';
      
    return Directionality(
      textDirection:
        isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 22,
              color: mediumGreen,
            ),
            children: [
            translatedSpan(context, context.t.so),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                  translatedText(context: context, text: context.t.chafe, color: brown),
                  ],
                ),
              ),
              translatedSpan(context, context.t.willMakeYouSmile)
            ],
          ),
        ),
    );
  }

  Widget landingScreen3(BuildContext context){
    return standartLandingScreen(
      context: context,
      page: AppRoutes.loginScreen,
      coffeeDesign: standardImage("assets/images/thirdLandingLogo.png"), 
      landingDescribe: specifiedText(context), 
      stepperIndex: 2
    );
  }

  const LandingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(child: landingScreen3(context));
  }
}

