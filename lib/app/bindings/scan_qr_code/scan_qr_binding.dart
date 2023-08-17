import 'package:get/get.dart';
import 'package:netspotpay/app/controllers/scan_qr_code/scan_qr_code_controller.dart';

class ScanQrCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScanQrCodeController());
  }
}
