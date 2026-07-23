import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/config/app_config.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:mini_ui_project/core/system_users/current_user.dart';
import 'package:mini_ui_project/core/models/profile_model/profile_information.dart';
import 'package:mini_ui_project/core/system_users/users.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/routing/app_routes.dart';
import 'package:mini_ui_project/core/widget/auth_widget/login_button.dart';
import 'package:mini_ui_project/features/auth/widgets/user_auth_widgets/common_auth_widget.dart';
import 'package:mini_ui_project/features/auth/widgets/user_auth_widgets/navigate_login_register_button.dart';
import 'package:mini_ui_project/features/auth/widgets/alert_dialog.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController loginUsernameController = TextEditingController();
  TextEditingController loginPhoneController = TextEditingController();
  
  
  final _loginKey = GlobalKey<FormState>();
  late String userISOCode;
  @override
  Widget build(BuildContext context) {
    final appConfig = Provider.of<AppConfig>(context, listen: true);
    return Material(
      color: lightYellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          commonAuthWidget(
            context: context, 
            key: _loginKey,
            usernameController: loginUsernameController,
            passwordController: loginPasswordController,
            phoneController: loginPhoneController,
            onCountryChanged: (code) {
              userISOCode = code;
            },
          ),
          SizedBox(height: 20,),

          actionButtonDesign(
          buttonColor: darkGreen,
          buttonName:Text(context.t.login, style:homeTextStyle,),
          loginKey: _loginKey, 
          onSuccess:() async{
            PersonProfile? foundUser;
            for (PersonProfile user in systemUsers) {
              if (user.phoneNumber.trim() == loginPhoneController.text.trim() &&
                  user.password.trim() == loginPasswordController.text.trim() &&
                  user.name.trim() == loginUsernameController.text.trim() 
                  && user.countryCode.trim() == userISOCode
                  ) {
                foundUser = user;
                break;
              }
            }
            if(foundUser != null) {
              currentUser = foundUser;
              appConfig.setIsLoggedIn(true);
              // appConfig.setToken("12Afsgf34434BDsserttR324");
              Navigator.pushReplacementNamed(context, AppRoutes.mainLayoutsScreen);
            }
            else{
              alertDialog(context);
            }
          },
          ),
          
          SizedBox(height: 20,),
          navigateButton(buttonName: context.t.createAccount, pageName: AppRoutes.registerScreen, context: context)
        ],
      ),
    );
  }
}