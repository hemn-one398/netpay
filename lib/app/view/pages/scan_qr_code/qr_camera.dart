// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';

class QrCamera extends StatefulWidget {
  QrCamera(
      {super.key,
      required this.qrViewController,
      required this.result,
      required this.globalKey});

  QRViewController? qrViewController;
  Barcode? result;
  final GlobalKey globalKey;
  @override
  State<QrCamera> createState() => _QrCameraState();
}

class _QrCameraState extends State<QrCamera> {
  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      widget.qrViewController?.pauseCamera();
    } else if (Platform.isIOS) {
      widget.qrViewController?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return QRView(
      key: widget.globalKey,
      onQRViewCreated: _onQRViewCreated,
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    widget.qrViewController = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        widget.result = scanData;
      });
    });
  }

  @override
  void dispose() {
    widget.qrViewController?.dispose();
    super.dispose();
  }
}
