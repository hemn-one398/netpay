import 'package:get/get.dart';
import 'package:netspotpay/app/controllers/dashboard/dashboard_controller.dart';
import 'package:netspotpay/app/controllers/home/home_controller.dart';
import 'package:netspotpay/app/controllers/inbox/inbox_controller.dart';
import 'package:netspotpay/app/controllers/profile/profile_controller.dart';
import 'package:netspotpay/app/controllers/topup/topup_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(
      () => HomeController(),
      fenix: true,
    );
    Get.lazyPut(
      () => InboxController(),
      fenix: true,
    );
    Get.lazyPut(
      () => TopUpController(),
      fenix: true,
    );
    Get.lazyPut(
      () => ProfileController(),
      fenix: true,
    );
  }
}
