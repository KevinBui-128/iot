import 'package:du_an_iot/blocs/login_bloc/login_bloc.dart';
import 'package:du_an_iot/configs/configs.dart';
import 'package:du_an_iot/screens/widgets/loadingScreen.dart';
import 'package:du_an_iot/streams/registerStream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:du_an_iot/screens/widgets/qrScreen.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _phone = TextEditingController();
  RegisterStream registerStream;
  GlobalKey forgotPassKey = GlobalKey();

  @override
  void initState() {
    registerStream = RegisterStream();
    super.initState();
  }

  @override
  void dispose() {
    registerStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoadingState) {
            LoadingPage(context: context);
          } else if (state is SuccessState) {
            _showDialog(context, state.title, state.message);
          } else if (state is ErrorState) {
            _showDialog(context, state.errorTitle, state.errorMessage);
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return bodyPage(screenWidth, screenHeight);
          },
        ),
      ),
    );
  }

  Widget bodyPage(double screenWidth, screenHeight) {
    String screen = "forgot";
    return Scaffold(
      key: forgotPassKey,
      body: Container(
        padding:
            EdgeInsets.fromLTRB(screenWidth * 0.05, 0, screenWidth * 0.05, 0),
        color: Colors.white30,
        height: screenHeight,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // appbar
              SafeArea(
                top: true,
                left: true,
                right: true,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: screenWidth * 0.1,
                    height: screenWidth * 0.1,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(32)),
                    child: Center(
                        child: Icon(
                      Icons.clear,
                      color: Colors.red,
                    )),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.15),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, screenHeight * 0.02),
                child: StreamBuilder(
                  stream: registerStream.phoneStream,
                  builder: (context, snapshot) => TextField(
                    // focusNode: _passWord,
                    controller: _phone,
                    keyboardType: TextInputType.phone,
                    onChanged: (va) {
                      registerStream.phoneNumChange(va);
                    },
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        labelText: 'Phone Number',
                        errorText: snapshot.hasError ? snapshot.error : null,
                        labelStyle:
                            TextStyle(color: Color(0xffd888888), fontSize: 15)),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, screenHeight * 0.02),
                child: StreamBuilder(
                  stream: registerStream.emailStream,
                  builder: (context, snapshot) => TextField(
                    // focusNode: _userName,
                    // onSubmitted: (va) {
                    //   _fieldFocusChange(context, _userName, _passWord);
                    // },
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (va) {
                      registerStream.emailChange(va);
                    },
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        labelText: 'Email',
                        errorText: snapshot.hasError ? snapshot.error : null,
                        labelStyle:
                            TextStyle(color: Color(0xffd888888), fontSize: 15)),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, screenHeight * 0.02),
                child: StreamBuilder(
                  stream: registerStream.passwordStream,
                  builder: (context, snapshot) => TextField(
                    // focusNode: _passWord,
                    controller: _pass,
                    onChanged: (va) {
                      registerStream.passwordChange(va);
                    },
                    obscureText: true,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        labelText: 'Password',
                        errorText: snapshot.hasError ? snapshot.error : null,
                        labelStyle:
                            TextStyle(color: Color(0xffd888888), fontSize: 15)),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QrScreen(screen)));
                },
                child: Container(
                    padding: EdgeInsets.fromLTRB(
                        0, screenHeight * 0.01, 0, screenHeight * 0.05),
                    child: Row(
                      children: <Widget>[
                        Container(
                            width: screenWidth * 0.2,
                            height: screenWidth * 0.07,
                            decoration: BoxDecoration(
                                color: Colors.red[400],
                                borderRadius: BorderRadius.circular(24)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Scan ",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white)),
                                Icon(Icons.center_focus_weak,
                                    color: Colors.white)
                              ],
                            )),
                        SizedBox(width: screenWidth * 0.02),
                        Container(
                          width: screenWidth * 0.07,
                          height: screenWidth * 0.07,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Center(
                            child: Utils.checkQRForgot
                                ? Icon(Icons.done, color: Colors.red, size: 18)
                                : Container(),
                          ),
                        )
                      ],
                    )),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, screenHeight * 0.05),
                child: Utils.checkQRForgot
                    ? SizedBox(
                        height: screenHeight * 0.08,
                        width: screenWidth,
                        child: RaisedButton(
                          onPressed: () {
                            BlocProvider.of<LoginBloc>(
                                    forgotPassKey.currentContext)
                                .add(
                              PressButtonForgotEvent(
                                  context: forgotPassKey.currentContext,
                                  phone: _phone.text,
                                  email: _email.text,
                                  password: _pass.text,
                                  registerStream: registerStream),
                            );
                          },
                          color: Colors.red[400],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Text(
                            'Change Password'.toUpperCase(),
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: screenHeight * 0.08,
                        width: screenWidth,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text(
                              'Change Password'.toUpperCase(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showDialog(BuildContext mainContext, String title, String message) async {
    await showDialog(
      context: mainContext,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text("Ok"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
