import 'package:du_an_iot/blocs/login_bloc/login_bloc.dart';
import 'package:du_an_iot/screens/forgotPasswordScreen.dart';
import 'package:du_an_iot/screens/widgets/loadingScreen.dart';
import 'package:du_an_iot/streams/loginStream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  double screenWidth;
  double screenHeight;
  LoginPage(this.screenWidth, this.screenHeight);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phone = TextEditingController();
  TextEditingController _pass = TextEditingController();
  LoginStream loginStream;
  GlobalKey loginKey = GlobalKey();

  @override
  void initState() {
    loginStream = LoginStream();
    super.initState();
  }

  @override
  void dispose() {
    loginStream.dispose();
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
          } else if (state is SuccessState) {
            _showDialog(context, state.title, state.message);
          }else if (state is ErrorState) {
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
    return Scaffold(
      key: loginKey,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(
              screenWidth * 0.05, screenHeight * 0.1, screenWidth * 0.05, 0),
          color: Colors.white30,
          height: screenHeight * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, screenHeight * 0.02),
                child: StreamBuilder(
                  stream: loginStream.emailStream,
                  builder: (context, snapshot) => TextField(
                    // focusNode: _userName,
                    // onSubmitted: (va) {
                    //   _fieldFocusChange(context, _userName, _passWord);
                    // },
                    controller: _phone,
                    keyboardType: TextInputType.phone,
                    onChanged: (va) {
                      loginStream.phoneNumChange(va);
                    },
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        labelText: 'Phone',
                        errorText: snapshot.hasError ? snapshot.error : null,
                        labelStyle:
                            TextStyle(color: Color(0xffd888888), fontSize: 15)),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, screenHeight * 0.05),
                child: StreamBuilder(
                  stream: loginStream.passwordStream,
                  builder: (context, snapshot) => TextField(
                    // focusNode: _passWord,
                    controller: _pass,
                    onChanged: (va) {
                      loginStream.passwordChange(va);
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
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, screenHeight * 0.05),
                child: SizedBox(
                  height: screenHeight * 0.08,
                  width: screenWidth,
                  child: RaisedButton(
                    onPressed: () {
                      BlocProvider.of<LoginBloc>(loginKey.currentContext).add(
                        PressButtonLoginEvent(
                            context: loginKey.currentContext,
                            phone: _phone.text,
                            password: _pass.text,
                            loginStream: loginStream),
                      );
                    },
                    color: Colors.red[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordPage()));
                },
                child: Container(
                  width: screenWidth * 0.4,
                  height: screenHeight * 0.05,
                  // color: Colors.red,
                  child: Center(
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(fontSize: 15),
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
