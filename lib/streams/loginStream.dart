import 'dart:async';

import 'package:du_an_iot/validations/validations.dart';

class LoginStream {
  StreamController _phoneController = StreamController.broadcast();
  StreamController _passController = StreamController.broadcast();
  Stream get emailStream => _phoneController.stream;
  Stream get passwordStream => _passController.stream;

  void phoneNumChange(String phoneNum) {
    if (!Validations.isValidPhoneNumber(phoneNum)) {
      _phoneController.sink.addError("Phone Number is not valid");
    }
    if (Validations.isValidPhoneNumber(phoneNum)) {
      _phoneController.sink.add("Ok");
    }
  }

  void passwordChange(String password) {
    if (!Validations.isValidPass(password)) {
      _passController.sink.addError("Password must have 4 characters or more");
    } else {
      _passController.sink.add("ok");
    }
  }

  bool isValidInfo({String phone, String password}) {
    bool status = true;
    if (!Validations.isValidPhoneNumber(phone)) {
      status = false;
    } else {}
    if (!Validations.isValidPass(password)) {
      status = false;
    } else {}
    return status;
  }

  void dispose() {
    _passController.close();
    _phoneController.close();
  }
}
