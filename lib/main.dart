import 'package:du_an_iot/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}