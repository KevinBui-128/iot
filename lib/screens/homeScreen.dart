import 'dart:async';

import 'package:du_an_iot/blocs/home_bloc/home_bloc.dart';
import 'package:du_an_iot/configs/configs.dart';
import 'package:du_an_iot/widgets/bathroom_screen.dart';
import 'package:du_an_iot/widgets/bedroom_screen.dart';
import 'package:du_an_iot/widgets/kitchen_screen.dart';
import 'package:du_an_iot/widgets/livingRoom_screen.dart';
import 'package:du_an_iot/widgets/stateHome_screen.dart';
import 'package:du_an_iot/widgets/yardGara_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _platformVersion = 'vi_VN';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      StateHomePage();
      YardGatePage();
      LivingRoomPage();
      BedroomPage();
      KitchenPage();
      BathroomPage();
    });
  }
  // update data
  void updateState() {
    if (Utils.ttCuaNha == "1") {
      Utils.cuaNha = true;
    } else if (Utils.ttCuaNha == "0") {
      Utils.cuaNha = false;
    } else if (Utils.ttQuanAo == "1") {
      Utils.quanAo = true;
    } else if (Utils.ttQuanAo == "0") {
      Utils.quanAo = false;
    } else if (Utils.ttDenKhach == "1") {
      Utils.denKhach = true;
    } else if (Utils.ttDenKhach == "0") {
      Utils.denKhach = false;
    } else if (Utils.ttQuatKhach == "1") {
      Utils.quatKhach = true;
    } else if (Utils.ttQuatKhach == "0") {
      Utils.quatKhach = false;
    } else if (Utils.ttDenNgu == "1") {
      Utils.denNgu = true;
    } else if (Utils.ttDenNgu == "0") {
      Utils.denNgu = false;
    } else if (Utils.ttQuatNgu == "1") {
      Utils.quatNgu = true;
    } else if (Utils.ttQuatNgu == "0") {
      Utils.quatNgu = false;
    } else if (Utils.ttDenBep == "1") {
      Utils.denBep = true;
    } else if (Utils.ttDenBep == "0") {
      Utils.denBep = false;
    } else if (Utils.ttQuatBep == "1") {
      Utils.quatBep = true;
    } else if (Utils.ttQuatBep == "0") {
      Utils.quatBep = false;
    } else if (Utils.ttDenTam == "1") {
      Utils.denTam = true;
    } else if (Utils.ttDenTam == "0") {
      Utils.denTam = false;
    } else {
      print('update statesss');
    }
  }
  // read data
  void readFirebase() {
    FirebaseDatabase.instance
        .reference()
        .once()
        .then((DataSnapshot dataSnapshot) {
      setState(() {
        Utils.nhietDo = dataSnapshot.value["NHIET_DO"].toString();
        Utils.doAm = dataSnapshot.value["DO_AM"].toString();
        Utils.khiGas = dataSnapshot.value["KHI_GAS"].toString();

        Utils.ttCuaNha = dataSnapshot.value["CUA_NHA"].toString();
        Utils.ttQuanAo = dataSnapshot.value["PHOI_QUAN_AO"].toString();
        Utils.ttDenKhach = dataSnapshot.value["DEN_PHONG_KHACH"].toString();
        // Utils.ttDenKhach = dataSnapshot.value["DEN_PHONG_NGU_2"].toString();
        // Utils.ttQuatKhach = dataSnapshot.value["QUAT_PHONG_KHACH"].toString();
        Utils.ttQuatKhach = dataSnapshot.value["DEN_PHONG_NGU_2"].toString();
        Utils.ttDenNgu = dataSnapshot.value["DEN_PHONG_NGU"].toString();
        Utils.ttQuatNgu = dataSnapshot.value["QUAT_PHONG_NGU"].toString();
        Utils.ttDenBep = dataSnapshot.value["DEN_PHONG_BEP"].toString();
        Utils.ttQuatBep = dataSnapshot.value["QUAT_PHONG_BEP"].toString();
        Utils.ttDenTam = dataSnapshot.value["DEN_PHONG_TAM"].toString();
      });
    });
  }
  // check permission voice
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

  @override
  void initState() {
    super.initState();
    initPlatformState();

    Timer.periodic(Duration(microseconds: 1000), (timer) {
      readFirebase();
      updateState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {},
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8.0,
                                      horizontal: 12.0,
                                    ),
                                    child: Text(
                                      Utils.resultText,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
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
                                    BlocProvider.of<HomeBloc>(context).add(
                                        PressBtnCheckVoiceEvent(
                                            context: context));
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
                                    BlocProvider.of<HomeBloc>(context)
                                        .add(PressBtnUncheckVoiceEvent());
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
          },
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
                StateHomePage(),
                YardGatePage(),
                LivingRoomPage(),
                BedroomPage(),
                KitchenPage(),
                BathroomPage(),
                const SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
