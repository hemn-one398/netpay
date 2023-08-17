import 'package:get/get.dart';
import 'package:netspotpay/app/util/routes/routes.dart';

class TopUpController extends GetxController {
  String? codeValidator(String? value) {
    if (value!.isEmpty) {
      return "Code is required";
    }
    return null;
  }

  void submit() {}

  void scanQrCode() {
    Get.toNamed(AppRoutes.SCAN_QR_PAGE);
  }
}
