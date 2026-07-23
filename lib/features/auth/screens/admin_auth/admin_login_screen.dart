import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/form_fields/password_text_form_field.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/routing/app_routes.dart';
import 'package:mini_ui_project/core/form_fields/user_name_text_form_field.dart';
import 'package:mini_ui_project/core/widget/auth_widget/login_button.dart';
import 'package:mini_ui_project/features/auth/screens/admin_auth/admin/admin_account.dart';
import 'package:mini_ui_project/features/auth/widgets/alert_dialog.dart';
import 'package:mini_ui_project/features/auth/widgets/common_auth_widgets.dart';
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController loginUsernameController = TextEditingController();
class AdminLoginScreen extends StatefulWidget {
  
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
  
}
Widget formWidget(
  {
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
          UsernameTextFormField(controller: loginUsernameController),
          PasswordTextFormField(controller: loginPasswordController),

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
            context: context,
            loginKey: loginKey
          ), 
          context
        ),
        SizedBox(height: 40,),
        actionButtonDesign(
          buttonColor: darkGreen,
          buttonName: Text(context.t.login, style: homeTextStyle,),
          loginKey: loginKey, 
          argument: loginUsernameController.text,
          onSuccess:() {
            if( (loginUsernameController.text == admin.name) && (loginPasswordController.text == admin.password)){
              Navigator.pushReplacementNamed(
                context, 
                AppRoutes.adminDataScreen, 
                arguments: loginUsernameController.text
              );
            }
            else{
              alertDialog(context);
            }
          },
        ),
      ],
          ),
    );
  }
}