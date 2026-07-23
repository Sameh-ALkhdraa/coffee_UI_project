

class PersonProfile{
  String? _image;
  String _name;
  String _phoneNumber;
  String _password;
  String _countryCode;
  int _numberOfBeans;
  PersonProfile({
    String? image,
    required String name,
    required String phoneNumber,
    required String password,
    required String countryCode,
    int numberOfBeans = 0,
  })  : _image = image,
        _name = name,
        _phoneNumber = phoneNumber,
        _password = password,
        _countryCode = countryCode,
        _numberOfBeans = numberOfBeans;

  // Getters
  String? get image => _image;
  String get name => _name;
  String get phoneNumber => _phoneNumber;
  String get password => _password;
  String get countryCode => _countryCode;
  int get numberOfBeans => _numberOfBeans;

  // Setters
  set image(String? value) => _image = value;
  set name(String value) => _name = value;
  set phoneNumber(String value) => _phoneNumber = value;
  set password(String value) => _password = value;
  set countryCode(String value) => _countryCode = value;
  set numberOfBeans(int value) => _numberOfBeans = value;
}