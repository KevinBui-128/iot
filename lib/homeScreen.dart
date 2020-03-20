import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;

  String resultText = "";

  bool cuaNha = true;
  bool denKhach = true;
  bool denNgu = true;
  bool denBep = true;
  bool denTam = true;
  bool quatKhach = true;
  bool quatNgu = true;
  bool quatBep = true;
  bool quatTam = true;

  var setAppBar = Text("Home");
  Icon setIcon = Icon(Icons.keyboard_voice);

  String moCua = 'assets/opendoor.png';
  String dongCua = 'assets/closeddoor.png';

  String batDenKhach = 'assets/lighton.png';
  String tatDenKhach = 'assets/lightoff.png';
  String batDenNgu = 'assets/lighton.png';
  String tatDenNgu = 'assets/lightoff.png';
  String batDenBep = 'assets/lighton.png';
  String tatDenBep = 'assets/lightoff.png';
  String batDenTam = 'assets/lighton.png';
  String tatDenTam = 'assets/lightoff.png';

  String batQuatKhach = 'assets/fanon.png';
  String tatQuatKhach = 'assets/fanoff.png';
  String batQuatNgu = 'assets/fanon.png';
  String tatQuatNgu = 'assets/fanoff.png';
  String batQuatBep = 'assets/fanon.png';
  String tatQuatBep = 'assets/fanoff.png';
  String batQuatTam = 'assets/fanon.png';
  String tatQuatTam = 'assets/fanoff.png';

  String cuaMo = 'Mở cửa';
  String cuaDong = 'Đóng cửa';

  String denKhachBat = 'Bật đèn';
  String denKhachTat = 'Tắt đèn';
  String denNguBat = 'Bật đèn';
  String denNguTat = 'Tắt đèn';
  String denBepBat = 'Bật đèn';
  String denBepTat = 'Tắt đèn';
  String denTamBat = 'Bật đèn';
  String denTamTat = 'Tắt đèn';

  String quatKhachBat = 'Bật quạt';
  String quatKhachTat = 'Tắt quạt';
  String quatNguBat = 'Bật quạt';
  String quatNguTat = 'Tắt quạt';
  String quatBepBat = 'Bật quạt';
  String quatBepTat = 'Tắt quạt';
  String quatTamBat = 'Bật quạt';
  String quatTamTat = 'Tắt quạt';

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
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

  void batTatVoice() {
    setState(() {
      switch (resultText.toString()) {
        case 'open':
          // phongKhach = true;
          break;
        case 'close':
          // phongKhach = false;
          break;
        default:
      }
    });
  }

  void vCuaNha() {
    setState(() {
      cuaNha = !cuaNha;
    });
  }

  void vDenKhach() {
    setState(() {
      denKhach = !denKhach;
    });
  }

  void vQuatKhach() {
    setState(() {
      quatKhach = !quatKhach;
    });
  }

  void vDenNgu() {
    setState(() {
      denNgu = !denNgu;
    });
  }

  void vQuatNgu() {
    setState(() {
      quatNgu = !quatNgu;
    });
  }

  void vDenBep() {
    setState(() {
      denBep = !denBep;
    });
  }

  void vQuatBep() {
    setState(() {
      quatBep = !quatBep;
    });
  }

  void vDenTam() {
    setState(() {
      denTam = !denTam;
    });
  }

  void vQuatTam() {
    setState(() {
      quatTam = !quatTam;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: setAppBar,
        actions: <Widget>[
          IconButton(
            icon: setIcon,
            onPressed: () {
              setState(() {
                if (this.setIcon.icon == Icons.keyboard_voice) {
                  this.setIcon = Icon(Icons.cancel);
                  this.setAppBar = Text(
                    resultText,
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  );

                  if (_isAvailable && !_isListening)
                    _speechRecognition
                        .listen(locale: "en_US")
                        // .listen(locale: "vi_VN")
                        .then((result) => print('$result'));
                } else {
                  this.setIcon = Icon(Icons.keyboard_voice);
                  this.setAppBar = Text("Home");
                }
              });
            },
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Container(
            color: Colors.blue[50],
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10.0),
                  wTrangThaiChung(),
                  wSanNhaGara(),
                  wPhongKhach(),
                  wPhongNgu(),
                  wPhongBep(),
                  wPhongTam(),
                  const SizedBox(height: 50.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget wTrangThaiChung() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 15, 0, 5),
              child: Text(
                'Trạng thái chung',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                // physics: AlwaysScrollableScrollPhysics(),
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: InkWell(
                      onTap: () {},
                      splashColor: Colors.red,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Image.asset(
                                quatKhach ? batDenKhach : tatDenKhach,
                                width: 50),
                          ),
                          Text(
                            quatKhach ? denKhachBat : denKhachTat,
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      )),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: InkWell(
                      onTap: () {},
                      splashColor: Colors.red,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                            child: Image.asset(
                                quatKhach ? batQuatKhach : tatQuatKhach,
                                width: 50),
                          ),
                          Text(
                            quatKhach ? quatKhachBat : quatKhachTat,
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(13, 10, 13, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.white12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Nhiệt độ',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Text('100*C',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Độ ẩm', style: TextStyle(fontSize: 15)),
                        Text('100',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget wSanNhaGara() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 15, 0, 5),
              child: Text(
                'Sân nhà - Gara',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                // physics: (),
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        vCuaNha();
                      },
                      splashColor: Colors.red,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Image.asset(cuaNha ? dongCua : moCua,
                                width: 50),
                          ),
                          Text(
                            cuaNha ? cuaDong : cuaMo,
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      )),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: InkWell(
                      onTap: () {},
                      splashColor: Colors.red,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                            child: Image.asset(
                                quatKhach ? batQuatKhach : tatQuatKhach,
                                width: 50),
                          ),
                          Text(
                            quatKhach ? quatKhachBat : quatKhachTat,
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(13, 10, 13, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.white12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Nhiệt độ',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Text('100*C',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Độ ẩm', style: TextStyle(fontSize: 15)),
                        Text('100',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget wPhongKhach() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 15, 0, 5),
              child: Text(
                'Phòng khách',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                // physics: (),
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        vDenKhach();
                      },
                      splashColor: Colors.red,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Image.asset(
                                denKhach ? batDenKhach : tatDenKhach,
                                width: 50),
                          ),
                          Text(
                            denKhach ? denKhachBat : denKhachTat,
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      )),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        vQuatKhach();
                      },
                      splashColor: Colors.red,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                            child: Image.asset(
                                quatKhach ? batQuatKhach : tatQuatKhach,
                                width: 50),
                          ),
                          Text(
                            quatKhach ? quatKhachBat : quatKhachTat,
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(13, 10, 13, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.white12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Nhiệt độ',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Text('100*C',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Độ ẩm', style: TextStyle(fontSize: 15)),
                        Text('100',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget wPhongNgu() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 15, 0, 5),
              child: Text(
                'Phòng ngủ',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                // physics: (),
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        vDenNgu();
                      },
                      splashColor: Colors.red,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Image.asset(denNgu ? batDenNgu : tatDenNgu,
                                width: 50),
                          ),
                          Text(
                            denNgu ? denNguBat : denNguTat,
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      )),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        vQuatNgu();
                      },
                      splashColor: Colors.red,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                            child: Image.asset(
                                quatNgu ? batQuatNgu : tatQuatNgu,
                                width: 50),
                          ),
                          Text(
                            quatNgu ? quatNguBat : quatNguTat,
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(13, 10, 13, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.white12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Nhiệt độ',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Text('100*C',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Độ ẩm', style: TextStyle(fontSize: 15)),
                        Text('100',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget wPhongBep() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 15, 0, 5),
              child: Text(
                'Phòng bếp',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                // physics: (),
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        vDenBep();
                      },
                      splashColor: Colors.red,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Image.asset(denBep ? batDenBep : tatDenBep,
                                width: 50),
                          ),
                          Text(
                            denBep ? denBepBat : denBepTat,
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      )),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        vQuatBep();
                      },
                      splashColor: Colors.red,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                            child: Image.asset(
                                quatBep ? batQuatBep : tatQuatBep,
                                width: 50),
                          ),
                          Text(
                            quatBep ? quatBepBat : quatBepTat,
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(13, 10, 13, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.white12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Nhiệt độ',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Text('100*C',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Độ ẩm', style: TextStyle(fontSize: 15)),
                        Text('100',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget wPhongTam() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 15, 0, 5),
              child: Text(
                'Phòng tắm',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                // physics: (),
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        vDenTam();
                      },
                      splashColor: Colors.red,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Image.asset(denTam ? batDenTam : tatDenTam,
                                width: 50),
                          ),
                          Text(
                            denTam ? denTamBat : denTamTat,
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      )),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        vQuatTam();
                      },
                      splashColor: Colors.red,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                            child: Image.asset(
                                quatTam ? batQuatTam : tatQuatTam,
                                width: 50),
                          ),
                          Text(
                            quatTam ? quatTamBat : quatTamTat,
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(13, 10, 13, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.white12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Nhiệt độ',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Text('100*C',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Độ ẩm', style: TextStyle(fontSize: 15)),
                        Text('100',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
