import 'package:du_an_iot/screens/loginScreen.dart';
import 'package:du_an_iot/screens/registerScreen.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/services.dart';

class LoginRegisterPage extends StatefulWidget {
  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage>
    with TickerProviderStateMixin {
  TabController _controller;
  String _platformVersion = 'vi_VN';
  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    initPlatformState();
    super.initState();
  }

  // permision app
  Future<void> initPlatformState() async {
    requestPermissionMicrophone();
    requestPermissionCamera();
    String platformVersion;
    try {} on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  void requestPermissionMicrophone() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.microphone);

    if (permission != PermissionStatus.granted) {
      await PermissionHandler()
          .requestPermissions([PermissionGroup.microphone]);
    }
  }

  void requestPermissionCamera() async {
    PermissionStatus permission =
        await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);

    if (permission != PermissionStatus.granted) {
      await PermissionHandler().requestPermissions([PermissionGroup.camera]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  color: Colors.red[200],
                  width: screenWidth,
                  height: screenHeight)),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: screenWidth,
                      color: Colors.red[200],
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child: Shimmer.fromColors(
                                period: Duration(milliseconds: 1500),
                                baseColor: Color(0xff7f00ff),
                                highlightColor: Color(0xffe100ff),
                                child: Container(
                                  padding: EdgeInsets.all(16.0),
                                  child: Center(
                                    child: Hero(
                                      tag: "text",
                                      child: Text(
                                        "My things",
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Pacifico',
                                            shadows: <Shadow>[
                                              Shadow(
                                                  blurRadius: 18.0,
                                                  color: Colors.black87,
                                                  offset: Offset.fromDirection(
                                                      120, 12))
                                            ]),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: TabBar(
                                  controller: _controller,
                                  labelColor: Colors.redAccent[400],
                                  unselectedLabelColor: Colors.white,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  indicator: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      color: Colors.white),
                                  tabs: [
                                    Tab(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text("LOGIN"),
                                      ),
                                    ),
                                    Tab(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text("REGISTER"),
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: SingleChildScrollView(
                        child: Container(
                      height: screenHeight * 0.8,
                      child: TabBarView(controller: _controller, children: [
                        LoginPage(screenWidth, screenHeight),
                        RegisterPage(screenWidth, screenHeight)
                      ]),
                    )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
