import 'package:du_an_iot/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';

class MyAppPage extends StatefulWidget {
  @override
  _MyAppPageState createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;

  String resultText = "nói gì đi ba";

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
    checkText();
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
      (bool result) => setState(() => _isAvailable = result),
    );

    _speechRecognition.setRecognitionStartedHandler(
      () => setState(() => _isListening = true),
    );

    _speechRecognition.setRecognitionResultHandler(
      (String speech) => setState(() => resultText = speech),
    );

    _speechRecognition.setRecognitionCompleteHandler(
      () => setState(() => _isListening = false),
    );

    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
        );
  }

  void checkText() {
    switch (resultText) {
      case "nói gì đi ba":
        {
          print('đang nói nè');
        }
        break;
      case "TWO":
        {}
        break;
      default:
        {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(flex: 18, child: HomePage()),
            Flexible(
                flex: 2,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                          flex: 6,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 12.0,
                            ),
                            child: Text(
                              resultText,
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                          )),
                      Flexible(
                        flex: 2,
                        child: IconButton(
                          icon: Icon(
                            Icons.mic,
                            color: Colors.blueAccent,
                            size: 40,
                          ),
                          onPressed: () {
                            if (_isAvailable && !_isListening)
                              _speechRecognition
                                  .listen(locale: "en_US")
                                  // .listen(locale: "vi_VN")
                                  .then((result) => print('$result'));
                          },
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: IconButton(
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.red,
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              resultText = "";
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
