import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text_plugins/speech_to_text_plugins.dart';

class GaoPage extends StatefulWidget {
  @override
  _GaoPageState createState() => _GaoPageState();
}

class _GaoPageState extends State<GaoPage> {
  String _platformVersion = 'Unknown';
  String textDay = 'aaa';

  SpeechToTextPlugins speechToTextPlugins = SpeechToTextPlugins();

  @override
  void initState() {
    super.initState();
    initPlatformState();
    
  }

  void requestPermission() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.microphone);

    if (permission != PermissionStatus.granted) {
      await PermissionHandler()
          .requestPermissions([PermissionGroup.microphone]);
    }
  }

  Future<void> initPlatformState() async {
    requestPermission();
    String platformVersion;
    try {
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: Container(
          child: Column(
            children: <Widget>[
              Text(textDay),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  RaisedButton(
                    child: Text('activate'),
                    onPressed: () {
                      speechToTextPlugins.activate().then((onValue) {
                        print(onValue);
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text('listen'),
                    onPressed: () {
                      speechToTextPlugins.listen().then((onValue) {
                        setState(() {
                          textDay = onValue.join("");
                          print(textDay);
                        });
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text('stop'),
                    onPressed: () {
                      speechToTextPlugins.stop().then((onValue) {
                        print(onValue);
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text('cancel'),
                    onPressed: () {
                      speechToTextPlugins.cancel().then((onValue) {
                        print(onValue);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
