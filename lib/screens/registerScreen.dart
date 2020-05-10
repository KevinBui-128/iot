import 'package:du_an_iot/blocs/login_bloc/login_bloc.dart';
import 'package:du_an_iot/configs/configs.dart';
import 'package:du_an_iot/screens/widgets/loadingScreen.dart';
import 'package:du_an_iot/streams/registerStream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:du_an_iot/screens/widgets/qrScreen.dart';

class RegisterPage extends StatefulWidget {
  double screenWidth;
  double screenHeight;
  RegisterPage(this.screenWidth, this.screenHeight);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _name = TextEditingController();
  RegisterStream registerStream;
  GlobalKey registerKey = GlobalKey();

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
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoadingState) {
            LoadingPage(context: context);
          } else if (state is ErrorState) {
            _showDialog(context, state.errorTitle, state.errorMessage);
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return bodyPage(widget.screenWidth, widget.screenHeight);
          },
        ),
      ),
    );
  }

  Widget bodyPage(double screenWidth, screenHeight) {
    String screen = "register";
    return Scaffold(
      key: registerKey,
      body: Container(
        padding: EdgeInsets.fromLTRB(
            screenWidth * 0.05, screenHeight * 0.03, screenWidth * 0.05, 0),
        color: Colors.white30,
        height: screenHeight * 0.8,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, screenHeight * 0.02),
                child: StreamBuilder(
                  stream: registerStream.nameStream,
                  builder: (context, snapshot) => TextField(
                    // focusNode: _passWord,
                    controller: _name,
                    onChanged: (va) {
                      registerStream.nameChange(va);
                    },
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        labelText: 'Name',
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
                            child: Utils.checkQRRegister
                                ? Icon(Icons.done, color: Colors.red, size: 18)
                                : Container(),
                          ),
                        )
                      ],
                    )),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, screenHeight * 0.05),
                child: Utils.checkQRRegister
                    ? SizedBox(
                        height: screenHeight * 0.08,
                        width: screenWidth,
                        child: RaisedButton(
                          onPressed: () {
                            BlocProvider.of<LoginBloc>(
                                    registerKey.currentContext)
                                .add(
                              PressButtonRegisterEvent(
                                  context: registerKey.currentContext,
                                  name: _name.text,
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
                            'REGISTER',
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
                              'REGISTER',
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
