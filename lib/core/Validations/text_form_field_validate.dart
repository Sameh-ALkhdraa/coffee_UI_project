import 'package:intl_phone_field/phone_number.dart';

class TextFormFieldValidate {
  static bool emptyValidation(String? value){
    return !(value == null || value.isEmpty || (value.trim() == ""));
  }
  static bool checkEmailValidation(String? email){
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',).hasMatch(email!);
  }
  static bool checkPassowrdStrength(String? password){
    return password!.length >= 8;
  }
  static bool checkPasswordConfirm(String? password, String? confirmPassword){
    return password == confirmPassword;
  }
  static bool emptyValidationOnPhone(PhoneNumber? phone){
    if(!(phone == null || phone.number.trim().isEmpty)){
      return true;
    }
    return false;
  }
}