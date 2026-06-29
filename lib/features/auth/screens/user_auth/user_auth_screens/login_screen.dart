import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/widget/common_text_from_field.dart';
import 'package:mini_ui_project/core/widget/login_button.dart';
import 'package:mini_ui_project/features/auth/screens/user_auth/auth_widget/create_account_button.dart';
import 'package:mini_ui_project/features/auth/screens/user_auth/user_auth_screens/register_screen.dart';
import 'package:mini_ui_project/features/auth/screens/user_auth/user_auth_screens/widget/common_auth_widget.dart';
import 'package:mini_ui_project/features/main_layout/main_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginKey = GlobalKey<FormState>();
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
            key: _loginKey
          ),
          SizedBox(height: 20,),
          loginButtonDesign(context: context, page: MainLayout(), loginKey: _loginKey),
          SizedBox(height: 20,),
          createAccountButtonDesign(context: context, page: RegisterScreen())
        ],
      ),
    );
  }
}