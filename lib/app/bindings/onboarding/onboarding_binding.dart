import 'package:get/get.dart';
import 'package:netspotpay/app/controllers/onborading/onboarding_controller.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingController());
  }
}
