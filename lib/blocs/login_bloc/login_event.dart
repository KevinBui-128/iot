part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class PressButtonLoginEvent extends LoginEvent {
  final String phone;
  final String password;
  final BuildContext context;
  final LoginStream loginStream;
  PressButtonLoginEvent(
      {@required this.phone,
      @required this.password,
      @required this.context,
      this.loginStream});
  @override
  List<Object> get props => [phone, password];
}

class PressButtonRegisterEvent extends LoginEvent {
  final String email;
  final String password;
  final String phone;
  final String name;
  final BuildContext context;
  final RegisterStream registerStream;
  PressButtonRegisterEvent(
      {@required this.email,
      @required this.password,
      @required this.phone,
      @required this.name,
      @required this.context,
      this.registerStream});
  @override
  List<Object> get props => [email, password, phone, name];
}

class PressButtonForgotEvent extends LoginEvent {
  final String email;
  final String password;
  final String phone;
  final BuildContext context;
  final RegisterStream registerStream;
  PressButtonForgotEvent(
      {@required this.email,
      @required this.password,
      @required this.phone,
      @required this.context,
      this.registerStream});
  @override
  List<Object> get props => [email, password, phone];
}

class ShowPasswordEvent extends LoginEvent {
  final bool showPass;
  ShowPasswordEvent({@required this.showPass});
  List<Object> get props => [showPass];
}
