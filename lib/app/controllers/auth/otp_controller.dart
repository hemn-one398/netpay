import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netspotpay/app/util/routes/routes.dart';

class OtpController extends GetxController {
  TextEditingController otpController = TextEditingController();
  void resendTheCode() {}

  void verify() {
    debugPrint(otpController.text);
    Get.toNamed(AppRoutes.DASHBOARD);
  }
}
