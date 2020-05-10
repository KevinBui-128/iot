import 'dart:async';

import 'package:connection_status_bar/connection_status_bar.dart';
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
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  void initState() {
    super.initState();

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
            return bodyPage();
          },
        ),
      ),
    );
  }

  Widget bodyPage() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("The total control house"),
        centerTitle: true,
        leading: Container(),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 0, left: 0, right: 0, child: giaoDienChung(screenHeight)),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: voice(screenWidth, screenHeight)),
            Positioned(
                bottom: screenHeight * 0.05,
                left: 0,
                right: 0,
                child: thongBao(screenWidth, screenHeight)),
          ],
        ),
      ),
    );
  }

  Widget giaoDienChung(double screenHeight) {
    return SafeArea(
      top: true,
      left: true,
      right: true,
      child: Container(
        padding: EdgeInsets.only(bottom: screenHeight*0.2),
        height: screenHeight,
        color: Colors.blue[50],
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              StateHomePage(),
              YardGatePage(),
              LivingRoomPage(),
              BedroomPage(),
              // KitchenPage(),
              // BathroomPage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget voice(double screenWidth, screenHeight) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {},
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Container(
              height: screenHeight * 0.1,
              color: Colors.white,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                        flex: 6,
                        child: Container(
                          width: screenWidth * 0.8,
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
                          Utils.voiceListen = true;
                          BlocProvider.of<HomeBloc>(context)
                              .add(PressBtnCheckVoiceEvent(context: context));
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
                          Utils.voiceListen = false;
                          BlocProvider.of<HomeBloc>(context)
                              .add(PressBtnUncheckVoiceEvent());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget thongBao(double screenWidth, screenHeight) {
    return Container(
      height: screenHeight * 0.05,
      child: Utils.voiceListen
          ? ConnectionStatusBar(
              height: screenHeight * 0.05,
              width: screenWidth,
              color: Colors.green[500],
              endOffset: const Offset(0.0, 0.0),
              beginOffset: const Offset(0.0, -1.0),
              animationDuration: Duration(microseconds: 200),
              title: Text("You can say",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            )
          : Container(color: Colors.transparent),
    );
  }
}
