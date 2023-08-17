import 'package:get/get.dart';
import 'package:netspotpay/app/controllers/auth/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpController());
  }
}
