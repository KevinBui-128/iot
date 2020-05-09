class Validations{
  static bool isValidText(String text) {
    return text != null && text.length > 4;
  }

  static bool isValidEmail(String email) {
    RegExp reg = new RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return reg.hasMatch(email);
  }

  static bool isValidPass(String pass) {
    return pass != null && pass.length >= 4 && pass.length <= 10;
  }

  static bool isValidConfirmPass(String pass, String confirmpass) {
    return confirmpass != null && confirmpass.length > 0 && pass == confirmpass;
  }

  static bool isValidPhoneNumber(String number) {
    RegExp regExp = new RegExp(r'^(?:[+0]9)?[0-9]{10}$');
    return regExp.hasMatch(number);
  }

}