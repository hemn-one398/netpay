import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netspotpay/app/controllers/dashboard/dashboard_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrCodeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabViewrController;
  Barcode? receiveResult, sendResult;
  QRViewController? receiveQrCamController, sendQrCamController;
  final GlobalKey receiveQrKey = GlobalKey(debugLabel: 'receiveQrcode');
  final GlobalKey sendQrKey = GlobalKey(debugLabel: 'sendQrCode');
  @override
  void onInit() {
    tabViewrController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  void enterManually() {
    DashboardController dashboardController = Get.find();
    // to Top up page
    dashboardController.onNavbarChanged(1);

    Get.back();
  }
}
