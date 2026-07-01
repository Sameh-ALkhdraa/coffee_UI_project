import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/routing/app_routes.dart';
import 'package:mini_ui_project/core/widget/common_text_from_field.dart';
import 'package:mini_ui_project/core/widget/login_button.dart';
import 'package:mini_ui_project/features/auth/widgets/common_auth_widgets.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}
Widget formWidget(
  {
    required VoidCallback onTap, 
    required BuildContext context,
    required GlobalKey<FormState> loginKey

  }
)
{
  return SizedBox(
    width: 300,
    height: 300,
    child: Form(
      key: loginKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          usernameTextFormField(context: context),
          passwordTextFormField(onTap: onTap, context: context),
        ],
      ),
    ),
  );
}
class _AdminLoginScreenState extends State<AdminLoginScreen> {
  
  final loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: lightYellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        authBackground(
          formWidget(
            onTap: () {
              setState(() {
                isHidden = !isHidden;
              });
            },
            context: context,
            loginKey: loginKey
          ), 
          context
        ),
        SizedBox(height: 40,),
        loginButtonDesign(context: context, page: AppRoutes.adminDataScreen, loginKey: loginKey, argument: loginUsernameController.text),
      ],
          ),
    );
  }
}