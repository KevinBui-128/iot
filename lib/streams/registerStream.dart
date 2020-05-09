import 'dart:async';

import 'package:du_an_iot/validations/validations.dart';

class RegisterStream {
  StreamController _emailController = StreamController.broadcast();
  StreamController _passController = StreamController.broadcast();
  StreamController _rePassController = StreamController.broadcast();
  StreamController _phoneController = StreamController.broadcast();
  StreamController _nameController = StreamController.broadcast();
  Stream get emailStream => _emailController.stream;
  Stream get passwordStream => _passController.stream;
  Stream get rePasswordStream => _rePassController.stream;
  Stream get phoneStream => _phoneController.stream;
  Stream get nameStream => _nameController.stream;

  void emailChange(String email) {
    if (!Validations.isValidEmail(email)) {
      _emailController.sink.addError("Email is not valid");
    } else {
      _emailController.sink.add("ok");
    }
  }

  void passwordChange(String password) {
    if (!Validations.isValidPass(password)) {
      _passController.sink.addError("Password must have 4 characters or more");
    } else {
      _passController.sink.add("ok");
    }
  }

  void repassWordChange(String pass, String repass) {
    if (!Validations.isValidConfirmPass(pass, repass)) {
      _rePassController.sink.addError("Retype invalid password");
    }
    if (Validations.isValidConfirmPass(pass, repass)) {
      _rePassController.sink.add("Ok");
    }
  }

  void phoneNumChange(String phoneNum) {
    if (!Validations.isValidPhoneNumber(phoneNum)) {
      _phoneController.sink.addError("Phone Number is not valid");
    }
    if (Validations.isValidPhoneNumber(phoneNum)) {
      _phoneController.sink.add("Ok");
    }
  }

  void nameChange(String name) {
    if (!Validations.isValidText(name)) {
      _nameController.sink.addError("Name must have 4 characters or more");
    } else {
      _nameController.sink.add("ok");
    }
  }

  bool isValidInfoRegister({String email, String password,String phone, String name}) {
    bool status = true;
    if (!Validations.isValidEmail(email)) {
      status = false;
    } else {}
    if (!Validations.isValidPass(password)) {
      status = false;
    } else {}
    if (!Validations.isValidPhoneNumber(phone)) {
      status = false;
    } else {}
    if (!Validations.isValidText(name)) {
      status = false;
    } else {}
    return status;
  }

  bool isValidInfoForgot({String email, String password,String phone}) {
    bool status = true;
    if (!Validations.isValidEmail(email)) {
      status = false;
    } else {}
    if (!Validations.isValidPass(password)) {
      status = false;
    } else {}
    if (!Validations.isValidPhoneNumber(phone)) {
      status = false;
    } else {}
    return status;
  }

  void dispose() {
    _passController.close();
    _emailController.close();
    _rePassController.close();
    _phoneController.close();
    _nameController.close();
  }
}
