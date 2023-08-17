import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netspotpay/app/util/routes/routes.dart';

class SignInController extends GetxController {
  var formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? usernameVaildator(String? value) {
    if (value!.isEmpty) {
      return "Username is required";
    }
    return null;
  }

  void signIn() async {
    //check validation
    // Sign in here
    Get.toNamed(AppRoutes.OTP_PAGE);
  }

  void goToRegisterPage() {
    Get.toNamed(AppRoutes.REGISTER_PAGE);
  }
}
