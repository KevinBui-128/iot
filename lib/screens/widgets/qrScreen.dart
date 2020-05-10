import 'package:connection_status_bar/connection_status_bar.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';
import 'package:du_an_iot/configs/configs.dart';

class QrScreen extends StatefulWidget {
  String screen;
  QrScreen(this.screen);
  @override
  _QrScreenState createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  GlobalKey qrKey = GlobalKey();
  QRViewController controller;
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
            right: 0,
            bottom: 0,
            child: QRView(
              key: qrKey,
              overlay: QrScannerOverlayShape(
                  borderRadius: 10,
                  borderColor: Colors.red,
                  borderLength: 35,
                  borderWidth: 10,
                  cutOutSize: 300),
              onQRViewCreated: onView,
            ),
          ),
          Positioned(
            top: 0,
            left: screenWidth * 0.05,
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: screenWidth * 0.1,
                  height: screenWidth * 0.1,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(32)),
                  child: Center(
                      child: Icon(
                    Icons.clear,
                    color: Colors.red,
                  )),
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.2,
            left: 0,
            right: 0,
            child:
                // Container(
                //     width: screenWidth,
                //     height: screenHeight * 0.1,
                //     // color: Colors.yellow,
                //     child: thongBao("Correct QRbbbbbbbbbbbbb"))

                Utils.showText
                    ? thongBao("Correct QR")
                    : Container(color: Colors.transparent),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void onView(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        if (scanData == Utils.dataQR) {
          if (widget.screen == "register") {
            Utils.checkQRRegister = true;
          } else {
            Utils.checkQRForgot = true;
          }
          Utils.showText = true;
        }else{
          Utils.checkQRRegister = false;
          Utils.checkQRForgot = false;
          Utils.showText = false;
        }
      });
    });
  }

  Widget thongBao(String text) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.1,
        child: ConnectionStatusBar(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width,
          color: Colors.green[500],
          endOffset: const Offset(0.0, 0.0),
          beginOffset: const Offset(0.0, -1.0),
          animationDuration: Duration(microseconds: 200),
          title:
              Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),
        ));
  }
}
