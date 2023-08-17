import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netspotpay/app/util/routes/routes.dart';

class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  int selectedNavBarItemIndex = 0;

  late TabController tabViewController;

  scanQrPage() {
    Get.toNamed(AppRoutes.SCAN_QR_PAGE);
  }

  @override
  void onInit() {
    tabViewController = TabController(length: 4, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabViewController.dispose();
    super.onClose();
  }

  void onNavbarChanged(int index) {
    selectedNavBarItemIndex = index;
    tabViewController.animateTo(selectedNavBarItemIndex);
    update(["navbarBuilder"]);
  }
}
