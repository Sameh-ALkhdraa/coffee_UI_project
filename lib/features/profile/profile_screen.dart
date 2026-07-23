import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:mini_ui_project/core/widget/arrow_back.dart';
import 'package:mini_ui_project/core/widget/language_button.dart';
import 'package:mini_ui_project/core/system_users/current_user.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/routing/app_routes.dart';
import 'package:mini_ui_project/core/widget/auth_widget/auth_form_widget.dart';
import 'package:mini_ui_project/core/widget/auth_widget/login_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
    TextEditingController loginPasswordController = TextEditingController();
  TextEditingController loginUsernameController = TextEditingController();
  TextEditingController loginPhoneController = TextEditingController();
  final _loginKey = GlobalKey<FormState>();
  late String userISOCode;
  @override
  void initState() {
    loginUsernameController.text = currentUser!.name;
    loginPasswordController.text = currentUser!.password;
    loginPhoneController.text = currentUser!.phoneNumber;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: darkGreen,
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ArrowBack(),
                
                    Text(currentUser!.name, style: homeTextStyle.copyWith(fontSize: 25),),
                
                    LanguageButton()
                  ],
                ),
              ),
              SizedBox(height: 20,),
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(16),
                child: Image.asset(currentUser!.image ?? "assets/images/person.jpg"),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: gradient
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    formWidget(
                      onCountryChanged: (code) {
                        userISOCode = code;
                      },
                      loginKey: _loginKey, 
                      loginUsernameController: loginUsernameController, 
                      loginPasswordController: loginPasswordController, 
                      phoneController: loginPhoneController, 
                      height: 511,),
        
                      actionButtonDesign(
                        buttonName: Text(context.t.saveChanges, style: homeTextStyle,), 
                        buttonColor: darkYellow, 
                        loginKey: _loginKey,
                        onSuccess: () {
                          currentUser!.name = loginUsernameController.text;
                          currentUser!.phoneNumber = loginPhoneController.text;
                          currentUser!.password = loginPasswordController.text;
                          currentUser!.countryCode = userISOCode;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                children: [
                                  Icon(Icons.check_circle, color: Colors.white),
                                  SizedBox(width: 10),
                                  Text(context.t.changesSavedSuccessfully),
                                ],
                              ),
                              backgroundColor: Colors.green,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              SizedBox(height: 20,),
              actionButtonDesign(
                buttonName: Text(context.t.logOut, style: homeTextStyle,), 
                buttonColor: Colors.red, 
                loginKey: _loginKey,
                onSuccess:() {
                  currentUser = null;
                  Navigator.pushNamedAndRemoveUntil(context, AppRoutes.loginScreen, (_) => false);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}