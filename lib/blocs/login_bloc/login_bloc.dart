import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:du_an_iot/configs/configs.dart';
import 'package:du_an_iot/screens/homeScreen.dart';
import 'package:du_an_iot/streams/loginStream.dart';
import 'package:du_an_iot/streams/registerStream.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  DatabaseReference firebase = FirebaseDatabase.instance.reference();
  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    try {
      // login
      if (event is PressButtonLoginEvent) {
        yield LoadingState();
        if (event.loginStream.isValidInfo(
            phone: event.phone.trim(), password: event.password.trim())) {
          firebase.child("user").once().then(
            (DataSnapshot dataSnapshot) {
              if (null != dataSnapshot.value[event.phone.trim()]) {
                if (event.password.trim() ==
                    dataSnapshot.value[event.phone.trim()]["password"]) {
                  Utils.name =
                      dataSnapshot.value[event.phone.trim()]["name"];
                  Navigator.push(event.context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                } else {
                  _showDialog(event.context, "Error Message", "Wrong Password");
                }
              } else {
                _showDialog(event.context, "Error Message",
                    "Unregistered Phone Number");
              }
            },
          );
        } else {
          yield ErrorState(
              errorTitle: "Error message", errorMessage: "Login Failed");
        }
      }
      // register
      if (event is PressButtonRegisterEvent) {
        yield LoadingState();
        if (event.registerStream.isValidInfoRegister(
            email: event.email.trim(),
            password: event.password.trim(),
            phone: event.phone.trim(),
            name: event.name.trim())) {
          firebase.child("user").once().then(
            (DataSnapshot dataSnapshot) {
              if (null == dataSnapshot.value[event.phone.trim()]) {
                firebase.child("user").child(event.phone.trim()).set({
                  "password": event.password.trim(),
                  "email": event.email.trim(),
                  "name": event.name.trim()
                });
                Utils.checkQRRegister = false;
                Utils.showText = false;
                _showDialog(event.context, "Message", "Register Success");
              } else {
                _showDialog(
                    event.context, "Error Message", "Registered Phone Number");
              }
            },
          );
        } else {
          yield ErrorState(
              errorTitle: "Error Message", errorMessage: "Register Failed");
        }
      }
      // forgot password
      if (event is PressButtonForgotEvent) {
        yield LoadingState();
        if (event.registerStream.isValidInfoForgot(
            email: event.email.trim(),
            password: event.password.trim(),
            phone: event.phone.trim())) {
          firebase.child("user").once().then(
            (DataSnapshot dataSnapshot) {
              if (null != dataSnapshot.value[event.phone.trim()]) {
                if (event.email.trim() ==
                    dataSnapshot.value[event.phone.trim()]["email"]) {
                  firebase
                      .child("user")
                      .child(event.phone.trim())
                      .update({"password": event.password.trim()});
                  Utils.checkQRForgot = false;
                  Utils.showText = false;
                  _showDialog(
                      event.context, "Message", "Change Password Success");
                } else {
                  _showDialog(
                      event.context, "Error Message", "Email Does Not Match");
                }
              } else {
                _showDialog(event.context, "Error Message",
                    "Unregistered Phone Number");
              }
            },
          );
        } else {
          yield ErrorState(
              errorTitle: "Error Message",
              errorMessage: "Password Change Failed");
        }
      }
    } catch (e) {
      print(e.toString());
      yield ErrorState(
          errorTitle: "Error Message", errorMessage: "Error ${e.toString()}");
    }
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
