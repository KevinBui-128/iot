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
        }
      });
    });
  }
}
