import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netspotpay/app/controllers/auth/signin_controller.dart';
import 'package:netspotpay/app/util/constants/app_asset_const.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';
import 'package:netspotpay/app/view/widgets/custom_inputs/custom_textfield.dart';
import 'package:netspotpay/app/view/widgets/scroll_column_expandable.dart';
import 'package:netspotpay/app/view/widgets/custom_action_button.dart';
import 'package:netspotpay/app/view/widgets/custom_logo_and_forget_credentials.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.HORIZONTAL_PADDING,
          ),
          child: ScrollColumnExpandable(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomLogoAndForgetPasswordWidget(),
              const Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Let’s Sign You In",
                    style: TextStyle(
                      color: AppColors.BLACK,
                      fontWeight: FontWeight.bold,
                      fontSize: AppDimensions.FONT_SIZE24,
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "Welcome back, you’ve been missed!",
                    style: TextStyle(
                      color: AppColors.LIGHT_BLACK,
                      fontSize: AppDimensions.FONT_SIZE14,
                    ),
                  ),
                ],
              )),
              Expanded(
                  child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      iconColor: AppColors.BLACK,
                      iconPath: AppAssets.USER,
                      labelText: "Username",
                      textEditingController: controller.usernameController,
                      validator: controller.usernameVaildator,
                    ),
                    CustomTextField(
                      iconColor: AppColors.BLACK,
                      iconPath: AppAssets.LOCK,
                      labelText: "Password",
                      textEditingController: controller.passwordController,
                      isPasswordField: true,
                    ),
                  ],
                ),
              )),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomActionButton(
                    text: "Sign In",
                    onTap: controller.signIn,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomActionButton(
                    text: "Create an account",
                    onTap: controller.goToRegisterPage,
                    color: AppColors.GREY_COLOR,
                    textColor: AppColors.BLACK,
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
