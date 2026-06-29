import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/widget/common_text_from_field.dart';
import 'package:mini_ui_project/core/widget/custom_button.dart';
import 'package:mini_ui_project/features/auth/screens/user_auth/user_auth_screens/login_screen.dart';
import 'package:mini_ui_project/features/auth/screens/user_auth/auth_widget/common_auth_widget.dart';
import 'package:mini_ui_project/localization/l10n/app_localization.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _registerKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
        color: lightYellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            commonAuthWidget(
            onTap: (){
              setState(() {
                isHidden = !isHidden;
              });
            }, 
            context: context, 
            key: _registerKey
          ),
          SizedBox(height: 20,),
            standardButtonDesign(
              context: context,
              buttonName: AppLocalizations.of(context)!.register,
              page: LoginScreen(),
              buttonColor: darkGreen,
              textColor: whiteButtonTextColor,
              loginKey: _registerKey
            ),
          ],
        ),
    );
  }
}