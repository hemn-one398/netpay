import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netspotpay/app/model/onborading_model.dart';
import 'package:netspotpay/app/util/constants/app_asset_const.dart';
import 'package:netspotpay/app/util/routes/routes.dart';

class OnBoardingController extends GetxController {
  PageController pageController = PageController();
  int pagePositionValue = 0;

  List<OnBoardingModel> pages = [
    OnBoardingModel(
      imagePath: AppAssets.PRESTIGE_AND_ABSOLUTE_SECURITY_IMAGE_PATH,
      title: "Prestige and Absolute Security",
      description:
          "Licensed by all banks in the world & secured with multi-tier PCI-DSS international standards",
    ),
    OnBoardingModel(
      imagePath: AppAssets.LEADING_PAYMENT_APPLICATION_IMAGE_PATH,
      title: "Leading Payment Application",
      description: "Consumer Loan Payment, pay bills and many other services",
    ),
    OnBoardingModel(
      imagePath: AppAssets.QUICK_AND_EASY_IMAGE_PATH,
      title: "Quick And Easy Money Transfer",
      description:
          "Send and receive money quickly just need a phone number or simple QR code",
    )
  ];

  void onTapOnNextButton() {
    //If we are at the last page then we go to authentication pages
    if (pagePositionValue == pages.length - 1) {
      Get.offAllNamed(AppRoutes.SIGNIN_PAGE);
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.linear);
    }
  }

  void onPageChanged(int value) {
    pagePositionValue = value;
    update();
  }
}
