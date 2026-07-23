import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfig extends ChangeNotifier{
  String selectedLanguage = 'en';
  late String tokenizer;
  bool isLoggedIn = false;
  bool isFirstTime = true;
  late SharedPreferences _preferences;

  Future<void> init() async{
    _preferences = await SharedPreferences.getInstance();
    loadPrefs();
  }
  void loadPrefs(){
    selectedLanguage = _preferences.getString("lang") ?? "en";
    tokenizer = _preferences.getString("token") ?? "token";

    isLoggedIn = _preferences.getBool("isLoggedIn") ?? false;
    isFirstTime = _preferences.getBool("isFirstTime") ?? true;
    notifyListeners();
  }

  void setLang(String langCode){
    _preferences.setString("lang", langCode);
    selectedLanguage = langCode;
    notifyListeners();
  }

  void setToken(String token){
    _preferences.setString("token", token);
    tokenizer = token;
    notifyListeners();
  }

  void setIsLoggedIn(bool auth){
    isLoggedIn = auth;
    _preferences.setBool("isLoggedIn", auth);
    notifyListeners();
  }

  void setIsFirstTime(bool firstTime){
    isFirstTime = firstTime;
    _preferences.setBool("isFirstTime", firstTime);
    notifyListeners();
  }

  String? getLang(){
    return _preferences.getString("lang");
  }
}