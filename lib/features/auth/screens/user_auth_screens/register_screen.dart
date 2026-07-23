import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:mini_ui_project/core/models/profile_model/profile_information.dart';
import 'package:mini_ui_project/core/system_users/users.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/routing/app_routes.dart';
import 'package:mini_ui_project/core/widget/auth_widget/login_button.dart';
import 'package:mini_ui_project/features/auth/widgets/user_auth_widgets/common_auth_widget.dart';
import 'package:mini_ui_project/features/auth/widgets/user_auth_widgets/navigate_login_register_button.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController   registerUsernameController = TextEditingController();
  TextEditingController   registerPhoneController = TextEditingController();
    TextEditingController registerPasswordController = TextEditingController();
  final _registerKey = GlobalKey<FormState>();
  String selectedCountryISOCode = "SY";
  @override
  Widget build(BuildContext context) {
    return Material(
        color: lightYellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            commonAuthWidget(
            context: context, 
            key: _registerKey,
            usernameController: registerUsernameController,
            passwordController: registerPasswordController,
            phoneController: registerPhoneController,
            onCountryChanged: (code) {
              selectedCountryISOCode = code;
            },
          ),
          SizedBox(height: 20,),
            actionButtonDesign(
              buttonName: Text(context.t.register, style: homeTextStyle,),
              buttonColor: darkGreen,
              loginKey: _registerKey,
              onSuccess: (){
                  systemUsers.add(
                    PersonProfile(
                      name: registerUsernameController.text,
                      phoneNumber: registerPhoneController.text,
                      password: registerPasswordController.text,
                      countryCode: selectedCountryISOCode,
                      numberOfBeans: 256
                    ),
                    
                  );
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.loginScreen,
                );
              }
            ),
            SizedBox(height: 20,),
            navigateButton(buttonName: context.t.goToLoginpage, pageName: AppRoutes.loginScreen, context: context)
          ],
        ),
    );
  }
}