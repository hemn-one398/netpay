import 'package:get/get.dart';
import 'package:netspotpay/app/controllers/auth/signin_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }
}
