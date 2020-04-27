import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text_plugins/speech_to_text_plugins.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String titleTrangThaiChung = "General state";
  String titleSanGara = "Yard - Gara";
  String titlePhongKhach = "Living room";
  String titlePhongNgu = "Bedroom";
  String titlePhongBep = "Kitchen";
  String titlePhongTam = "Bathroom";
  String titleBatDen = "Turn on";
  String titleTatDen = "Turn off";
  String titleBatQuat = "Turn on";
  String titleTatQuat = "Turn off";
  String titleNhietDo = "Temperature";
  String titleDoAm = "Humidity";
  String titleKhiGas = "Gas";
  String titleDen = "Lamp ";
  String titleQuat = "Fan ";
  String titleBat = "On";
  String titleTat = "Off";

  String _platformVersion = 'vi_VN';

  SpeechToTextPlugins speechToTextPlugins = SpeechToTextPlugins();

  bool _isAvailable = false;
  bool _isListening = false;

  String resultText = "";

  String nhietDo = "";
  String doAm = "";
  String ttCuaNha = "";
  String ttQuanAo = "";
  String khiGas = "";
  String ttDenKhach = "";
  String ttQuatKhach = "";
  String ttDenNgu = "";
  String ttQuatNgu = "";
  String ttDenBep = "";
  String ttQuatBep = "";
  String ttDenTam = "";

  bool nguon = false;
  bool cuaNha = false;
  bool quanAo = false;
  bool denKhach = false;
  bool denNgu = false;
  bool denBep = false;
  bool denTam = false;
  bool quatKhach = false;
  bool quatNgu = false;
  bool quatBep = false;
  // bool quatTam = false;

  var setAppBar = Text("Home");
  Icon setIcon = Icon(Icons.keyboard_voice);

  // String batDenTong = 'assets/lightallon.png';
  // String tatDenTong = 'assets/lightalloff.png';
  String batNguon = 'assets/batNguon.png';
  String tatNguon = 'assets/tatNguon.png';
  String moCua = 'assets/opendoor.png';
  String dongCua = 'assets/closeddoor.png';
  String phoiDo = 'assets/phoi.png';
  String thuDo = 'assets/thu.png';

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
  // String batQuatTam = 'assets/fanon.png';
  // String tatQuatTam = 'assets/fanoff.png';

  // String denTongBat = 'Bật tất cả đèn';
  // String denTongTat = 'Tắt tất cả đèn';
  String nguonBat = 'Open power';
  String nguonTat = 'Close power';
  String cuaMo = 'Open';
  String cuaDong = 'Close';
  String doPhoi = 'Dry';
  String doThu = 'Collect';

  String denKhachBat = 'Turn on';
  String denKhachTat = 'Turn off';
  String denNguBat = 'Turn on';
  String denNguTat = 'Turn off';
  String denBepBat = 'Turn on';
  String denBepTat = 'Turn off';
  String denTamBat = 'Turn on';
  String denTamTat = 'Turn off';

  String quatKhachBat = 'Turn on';
  String quatKhachTat = 'Turn off';
  String quatNguBat = 'Turn on';
  String quatNguTat = 'Turn off';
  String quatBepBat = 'Turn on';
  String quatBepTat = 'Turn off';
  // String quatTamBat = 'Turn on';
  // String quatTamTat = 'Turn off';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      wTrangThaiChung();
      wPhongKhach();
      wPhongNgu();
      wPhongBep();
      wPhongTam();
      wSanNhaGara();
    });
  }

  void vNguon() {
    setState(() {
      nguon = !nguon;
      // updateFirebase();
    });
  }

  void vCuaNha() {
    setState(() {
      cuaNha = !cuaNha;
      updateFirebase();
    });
  }

  void vQuanAo() {
    setState(() {
      quanAo = !quanAo;
      updateFirebase();
    });
  }

  void vDenKhach() {
    setState(() {
      denKhach = !denKhach;
      updateFirebase();
    });
  }

  void vQuatKhach() {
    setState(() {
      quatKhach = !quatKhach;
      updateFirebase();
    });
  }

  void vDenNgu() {
    setState(() {
      denNgu = !denNgu;
      updateFirebase();
    });
  }

  void vQuatNgu() {
    setState(() {
      quatNgu = !quatNgu;
      updateFirebase();
    });
  }

  void vDenBep() {
    setState(() {
      denBep = !denBep;
      updateFirebase();
    });
  }

  void vQuatBep() {
    setState(() {
      quatBep = !quatBep;
      updateFirebase();
    });
  }

  void vDenTam() {
    setState(() {
      denTam = !denTam;
      updateFirebase();
    });
  }

  void updateCuaNha() {
    if (ttCuaNha == "1") {
      cuaNha = true;
    } else if (ttCuaNha == "0") {
      cuaNha = false;
    } else {}
  }

  void updateQuanAo() {
    if (ttQuanAo == "1") {
      quanAo = true;
    } else {
      quanAo = false;
    }
  }

  void updateDenKhach() {
    if (ttDenKhach == "1") {
      denKhach = true;
    } else {
      denKhach = false;
    }
  }

  void updateQuatKhach() {
    if (ttQuatKhach == "1") {
      quatKhach = true;
    } else {
      quatKhach = false;
    }
  }

  void updateDenBep() {
    if (ttDenBep == "1") {
      denBep = true;
    } else {
      denBep = false;
    }
  }

  void updateQuatBep() {
    if (ttQuatBep == "1") {
      quatBep = true;
    } else {
      quatBep = false;
    }
  }

  void updateDenNgu() {
    if (ttDenNgu == "1") {
      denNgu = true;
    } else {
      denNgu = false;
    }
  }

  void updateQuatNgu() {
    if (ttQuatNgu == "1") {
      quatNgu = true;
    } else {
      quatNgu = false;
    }
  }

  void updateDenTam() {
    if (ttDenTam == "1") {
      denTam = true;
    } else {
      denTam = false;
    }
  }

  void updateState() {
    // sân nhà - gara
    if (ttCuaNha == "1") {
      cuaNha = true;
    } else if (ttCuaNha == "0") {
      cuaNha = false;
    } else if (ttQuanAo == "1") {
      quanAo = true;
    } else if (ttQuanAo == "0") {
      quanAo = false;
    }
    // phòng khách
    else if (ttDenKhach == "1") {
      denKhach = true;
    } else if (ttDenKhach == "0") {
      denKhach = false;
    } else if (ttQuatKhach == "1") {
      quatKhach = true;
    } else if (ttQuatKhach == "0") {
      quatKhach = false;
    }
    // phòng ngủ
    else if (ttDenNgu == "1") {
      denNgu = true;
    } else if (ttDenNgu == "0") {
      denNgu = false;
    } else if (ttQuatNgu == "1") {
      quatNgu = true;
    } else if (ttQuatNgu == "0") {
      quatNgu = false;
    }
    // phòng bếp
    else if (ttDenBep == "1") {
      denBep = true;
    } else if (ttDenBep == "0") {
      denBep = false;
    } else if (ttQuatBep == "1") {
      quatBep = true;
    } else if (ttQuatBep == "0") {
      quatBep = false;
    }
    // phòng tắm
    else if (ttDenTam == "1") {
      denTam = true;
    } else if (ttDenTam == "0") {
      denTam = false;
    } else {
      print('update statesss');
    }
  }

  void updateFirebase() {
    // nguồn tổng
    // if (nguon == true) {
    //   FirebaseDatabase.instance.reference().update({'CUA_NHA': '1'});
    // } else {
    //   FirebaseDatabase.instance.reference().update({'CUA_NHA': '0'});
    // }
    // sân nhà - gara
    if (nguon == true) {
      FirebaseDatabase.instance.reference().update({'CUA_NHA': '1'});
    } else {
      FirebaseDatabase.instance.reference().update({'CUA_NHA': '0'});
    }
    if (quanAo == true) {
      FirebaseDatabase.instance.reference().update({'PHOI_QUAN_AO': '1'});
    } else {
      FirebaseDatabase.instance.reference().update({'PHOI_QUAN_AO': '0'});
    }
    // phòng khách
    if (denKhach == true) {
      FirebaseDatabase.instance.reference().update({'DEN_PHONG_KHACH': '1'});
    } else {
      FirebaseDatabase.instance.reference().update({'DEN_PHONG_KHACH': '0'});
    }
    // if (denKhach == true) {
    //   FirebaseDatabase.instance.reference().update({'DEN_PHONG_NGU_2': '1'});
    // } else {
    //   FirebaseDatabase.instance.reference().update({'DEN_PHONG_NGU_2': '0'});
    // }
    if (quatKhach == true) {
      FirebaseDatabase.instance.reference().update({'DEN_PHONG_NGU_2': '1'});
    } else {
      FirebaseDatabase.instance.reference().update({'DEN_PHONG_NGU_2': '0'});
    }
    // phòng ngủ
    if (denNgu == true) {
      FirebaseDatabase.instance.reference().update({'DEN_PHONG_NGU': '1'});
    } else {
      FirebaseDatabase.instance.reference().update({'DEN_PHONG_NGU': '0'});
    }
    if (quatNgu == true) {
      FirebaseDatabase.instance.reference().update({'QUAT_PHONG_NGU': '1'});
    } else {
      FirebaseDatabase.instance.reference().update({'QUAT_PHONG_NGU': '0'});
    }
    // phòng bếp
    if (denBep == true) {
      FirebaseDatabase.instance.reference().update({'DEN_PHONG_BEP': '1'});
    } else {
      FirebaseDatabase.instance.reference().update({'DEN_PHONG_BEP': '0'});
    }
    if (quatBep == true) {
      FirebaseDatabase.instance.reference().update({'QUAT_PHONG_BEP': '1'});
    } else {
      FirebaseDatabase.instance.reference().update({'QUAT_PHONG_BEP': '0'});
    }
    // phòng tắm
    if (denTam == true) {
      FirebaseDatabase.instance.reference().update({'DEN_PHONG_TAM': '1'});
    } else {
      FirebaseDatabase.instance.reference().update({'DEN_PHONG_TAM': '0'});
    }
    print('updatefirebasesss');
  }

  void readFirebase() {
    FirebaseDatabase.instance
        .reference()
        .once()
        .then((DataSnapshot dataSnapshot) {
      // print(dataSnapshot.value);
      setState(() {
        nhietDo = dataSnapshot.value["NHIET_DO"].toString();
        doAm = dataSnapshot.value["DO_AM"].toString();
        khiGas = dataSnapshot.value["KHI_GAS"].toString();

        ttCuaNha = dataSnapshot.value["CUA_NHA"].toString();
        ttQuanAo = dataSnapshot.value["PHOI_QUAN_AO"].toString();
        ttDenKhach = dataSnapshot.value["DEN_PHONG_KHACH"].toString();
        // ttDenKhach = dataSnapshot.value["DEN_PHONG_NGU_2"].toString();
        // ttQuatKhach = dataSnapshot.value["QUAT_PHONG_KHACH"].toString();
        ttQuatKhach = dataSnapshot.value["DEN_PHONG_NGU_2"].toString();
        ttDenNgu = dataSnapshot.value["DEN_PHONG_NGU"].toString();
        ttQuatNgu = dataSnapshot.value["QUAT_PHONG_NGU"].toString();
        ttDenBep = dataSnapshot.value["DEN_PHONG_BEP"].toString();
        ttQuatBep = dataSnapshot.value["QUAT_PHONG_BEP"].toString();
        ttDenTam = dataSnapshot.value["DEN_PHONG_TAM"].toString();
      });
    });
  }

  Future<void> initPlatformState() async {
    requestPermission();
    String platformVersion;
    try {} on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  void requestPermission() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.microphone);

    if (permission != PermissionStatus.granted) {
      await PermissionHandler()
          .requestPermissions([PermissionGroup.microphone]);
    }
  }

  void checkText(String resultText) {
    switch (resultText) {
      case "turn on the living room lamp":
        {
          denKhach = true;
          updateFirebase();
          print("den khach batttttttttttt");
        }
        break;
      case "turn off the living room lamp":
        {
          denKhach = false;
          updateFirebase();
          print("Den khach tatttttttttttttttt");
        }
        break;
      case "turn on the living room fan":
        {
          quatKhach = true;
          updateFirebase();
          print("Bật quạt khách");
        }
        break;
      case "turn off the living room fan":
        {
          quatKhach = false;
          updateFirebase();
          print("Tắt quạt khách");
        }
        break;

      case "turn on the bedroom fan":
        {
          denNgu = true;
          updateFirebase();
          print("bật quạt ngủ");
        }
        break;
      case "turn off the bedroom fan":
        {
          denNgu = false;
          updateFirebase();
          print("bật quạt ngủ");
        }
        break;
      case "Turn on the bedroom fan":
        {
          quatNgu = true;
          updateFirebase();
        }
        break;
      case "Turn off the bedroom fan":
        {
          quatNgu = false;
          updateFirebase();
        }
        break;

      case "bật quạt khách":
        {
          quatKhach = true;
          updateFirebase();
        }
        break;
      case "tắt quạt khách":
        {
          quatKhach = false;
          updateFirebase();
        }
        break;
      case "bật đèn ngủ":
        {
          denNgu = true;
        }
        break;
      case "tắt đèn ngủ":
        {
          denNgu = false;
        }
        break;

      case "hello":
        {
          denKhach = true;
          updateFirebase();
          print("den khach batttttttttttt");
        }
        break;
      case "bye":
        {
          denKhach = false;
          updateFirebase();
          print("Den khach tatttttttttttttttt");
        }
        break;

      case "hi":
        {
          denKhach = true;
          updateFirebase();
          print("den khach batttttttttttt");
        }
        break;
      case "goodbye":
        {
          denKhach = false;
          updateFirebase();
          print("Den khach tatttttttttttttttt");
        }
        break;

      default:
        {
          _showDialog(context, "Warning!!!", "The statement does not exist");
        }
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

  @override
  void initState() {
    super.initState();
    initPlatformState();

    Timer.periodic(Duration(microseconds: 1000), (timer) {
      readFirebase();
      // updateState();
      updateCuaNha();
      updateQuanAo();
      updateDenKhach();
      updateDenBep();
      updateDenNgu();
      updateDenTam();
      updateQuatKhach();
      updateQuatBep();
      updateQuatNgu();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(flex: 18, child: giaoDienChung()),
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
                            speechToTextPlugins.listen().then((onValue) {
                              setState(() {
                                resultText = onValue[0];
                                checkText(resultText);
                                print(resultText);
                              });
                            });
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
                              speechToTextPlugins.cancel().then((onValue) {
                                resultText = "";
                                print(onValue);
                              });
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

  Widget giaoDienChung() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Container(
          color: Colors.blue[50],
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10.0),
                wTrangThaiChung(),
                // wSanNhaGara(),
                wPhongKhach(),
                wPhongNgu(),
                wPhongBep(),
                // wPhongTam(),
                const SizedBox(height: 50.0),
              ],
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
                titleTrangThaiChung,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            Container(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
              height: 150,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: InkWell(
                  onTap: () {
                    vNguon();
                  },
                  splashColor: Colors.red,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child:
                            Image.asset(nguon ? batNguon : tatNguon, width: 50),
                      ),
                      Text(
                        nguon ? nguonBat : nguonTat,
                        style: TextStyle(
                            fontSize: 15,
                            color: nguon ? Colors.green : Colors.red),
                      )
                    ],
                  )),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(13, 10, 13, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                width: double.infinity,
                height: 120,
                color: Colors.white12,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(titleSanGara,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(titleDen,
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                    Text(denKhach ? titleBat : titleTat,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: denKhach
                                                ? Colors.green
                                                : Colors.red)),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(titleQuat,
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                    Text(quatKhach ? titleBat : titleTat,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: quatKhach
                                                ? Colors.green
                                                : Colors.red)),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(titlePhongKhach,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(titleDen,
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                    Text(denKhach ? titleBat : titleTat,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: denKhach
                                                ? Colors.green
                                                : Colors.red)),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(titleQuat,
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                    Text(quatKhach ? titleBat : titleTat,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: quatKhach
                                                ? Colors.green
                                                : Colors.red)),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(titlePhongNgu,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(titleDen,
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                  Text(denNgu ? titleBat : titleTat,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: denNgu
                                              ? Colors.green
                                              : Colors.red)),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(titleQuat,
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                  Text(quatNgu ? titleBat : titleTat,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: quatNgu
                                              ? Colors.green
                                              : Colors.red)),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(titlePhongBep,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(titleDen,
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                    Text(denBep ? titleBat : titleTat,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: denBep
                                                ? Colors.green
                                                : Colors.red)),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(titleQuat,
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                    Text(quatBep ? titleBat : titleTat,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: quatBep
                                                ? Colors.green
                                                : Colors.red)),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(titlePhongTam,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(titleDen,
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                    Text(denTam ? titleBat : titleTat,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: denTam
                                                ? Colors.green
                                                : Colors.red)),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text('',
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                    Text("",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green)),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
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
                        Text(titleNhietDo,
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Text(nhietDo,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(titleDoAm, style: TextStyle(fontSize: 15)),
                        Text(doAm,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(titleKhiGas, style: TextStyle(fontSize: 15)),
                        Text(khiGas,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple))
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
                titleSanGara,
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
                            child: Image.asset(cuaNha ? moCua : dongCua,
                                width: 50),
                          ),
                          Text(
                            cuaNha ? cuaMo : cuaDong,
                            style: TextStyle(
                                fontSize: 15,
                                color: cuaNha ? Colors.green : Colors.red),
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
                        vQuanAo();
                      },
                      splashColor: Colors.red,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                            child:
                                Image.asset(quanAo ? phoiDo : thuDo, width: 50),
                          ),
                          Text(
                            quanAo ? doPhoi : doThu,
                            style: TextStyle(
                                fontSize: 15,
                                color: quanAo ? Colors.green : Colors.red),
                          )
                        ],
                      )),
                    ),
                  ),
                ],
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
                titlePhongKhach,
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
                            style: TextStyle(
                                fontSize: 15,
                                color: denKhach ? Colors.green : Colors.red),
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
                            style: TextStyle(
                                fontSize: 15,
                                color: quatKhach ? Colors.green : Colors.red),
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
                        Text(titleNhietDo,
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Text(nhietDo,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(titleDoAm, style: TextStyle(fontSize: 15)),
                        Text(doAm,
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
                titlePhongNgu,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
              child:
                  // GridView.count(
                  //   shrinkWrap: true,
                  //   crossAxisCount: 2,
                  //   // physics: (),
                  //   children: <Widget>[
                  //     Card(
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(15.0),
                  //       ),
                  //       child: InkWell(
                  //         onTap: () {
                  //           vDenNgu();
                  //         },
                  //         splashColor: Colors.red,
                  //         child: Center(
                  //             child: Column(
                  //           mainAxisSize: MainAxisSize.min,
                  //           children: <Widget>[
                  //             Padding(
                  //               padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  //               child: Image.asset(denNgu ? batDenNgu : tatDenNgu,
                  //                   width: 50),
                  //             ),
                  //             Text(
                  //               denNgu ? denNguBat : denNguTat,
                  //               style: TextStyle(fontSize: 15),
                  //             )
                  //           ],
                  //         )),
                  //       ),
                  //     ),
                  //     Card(
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(15.0),
                  //       ),
                  //       child: InkWell(
                  //         onTap: () {
                  //           vQuatNgu();
                  //         },
                  //         splashColor: Colors.red,
                  //         child: Center(
                  //             child: Column(
                  //           mainAxisSize: MainAxisSize.min,
                  //           children: <Widget>[
                  //             Padding(
                  //               padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                  //               child: Image.asset(
                  //                   quatNgu ? batQuatNgu : tatQuatNgu,
                  //                   width: 50),
                  //             ),
                  //             Text(
                  //               quatNgu ? quatNguBat : quatNguTat,
                  //               style: TextStyle(fontSize: 15),
                  //             )
                  //           ],
                  //         )),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Container(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                height: 150,
                child: Card(
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
                          style: TextStyle(
                              fontSize: 15,
                              color: denNgu ? Colors.green : Colors.red),
                        )
                      ],
                    )),
                  ),
                ),
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
                        Text(titleNhietDo,
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Text(nhietDo,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(titleDoAm, style: TextStyle(fontSize: 15)),
                        Text(doAm,
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
                titleSanGara,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
              child:
                  // GridView.count(
                  //   shrinkWrap: true,
                  //   crossAxisCount: 2,
                  //   // physics: (),
                  //   children: <Widget>[
                  //     Card(
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(15.0),
                  //       ),
                  //       child: InkWell(
                  //         onTap: () {
                  //           vDenBep();
                  //         },
                  //         splashColor: Colors.red,
                  //         child: Center(
                  //             child: Column(
                  //           mainAxisSize: MainAxisSize.min,
                  //           children: <Widget>[
                  //             Padding(
                  //               padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  //               child: Image.asset(denBep ? batDenBep : tatDenBep,
                  //                   width: 50),
                  //             ),
                  //             Text(
                  //               denBep ? denBepBat : denBepTat,
                  //               style: TextStyle(fontSize: 15),
                  //             )
                  //           ],
                  //         )),
                  //       ),
                  //     ),
                  //     Card(
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(15.0),
                  //       ),
                  //       child: InkWell(
                  //         onTap: () {
                  //           vQuatBep();
                  //         },
                  //         splashColor: Colors.red,
                  //         child: Center(
                  //             child: Column(
                  //           mainAxisSize: MainAxisSize.min,
                  //           children: <Widget>[
                  //             Padding(
                  //               padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                  //               child: Image.asset(
                  //                   quatBep ? batQuatBep : tatQuatBep,
                  //                   width: 50),
                  //             ),
                  //             Text(
                  //               quatBep ? quatBepBat : quatBepTat,
                  //               style: TextStyle(fontSize: 15),
                  //             )
                  //           ],
                  //         )),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Container(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                height: 150,
                child: Card(
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
                          style: TextStyle(
                              fontSize: 15,
                              color: denBep ? Colors.green : Colors.red),
                        )
                      ],
                    )),
                  ),
                ),
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
                        Text(titleNhietDo,
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Text(nhietDo,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(titleDoAm, style: TextStyle(fontSize: 15)),
                        Text(doAm,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(titleKhiGas, style: TextStyle(fontSize: 15)),
                        Text(khiGas,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple))
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
                titlePhongTam,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            Container(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
              height: 150,
              child: Card(
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
                        style: TextStyle(
                            fontSize: 15,
                            color: denTam ? Colors.green : Colors.red),
                      )
                    ],
                  )),
                ),
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
                        Text(titleNhietDo,
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Text(nhietDo,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(titleDoAm, style: TextStyle(fontSize: 15)),
                        Text(doAm,
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
