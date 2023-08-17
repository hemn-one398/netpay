import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netspotpay/app/controllers/auth/otp_controller.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';
import 'package:netspotpay/app/view/widgets/custom_otp/custom_pin_code_field.dart';
import 'package:netspotpay/app/view/widgets/scroll_column_expandable.dart';
import 'package:netspotpay/app/view/widgets/custom_action_button.dart';
import 'package:netspotpay/app/view/widgets/custom_logo_and_forget_credentials.dart';
import 'package:sizer/sizer.dart';

class OtpPage extends GetView<OtpController> {
  const OtpPage({super.key});

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
              Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "OTP Authentication",
                        style: TextStyle(
                          color: AppColors.BLACK,
                          fontWeight: FontWeight.bold,
                          fontSize: AppDimensions.FONT_SIZE24,
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      const Text(
                        "An authentication code has been sent to your email",
                        style: TextStyle(
                          color: AppColors.LIGHT_BLACK,
                          fontSize: AppDimensions.FONT_SIZE14,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomPinCodeField(
                        textEditingController: controller.otpController,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text.rich(TextSpan(
                        children: [
                          const TextSpan(
                            text: "I didn’t receive code.",
                            style: TextStyle(
                                color: AppColors.BLACK,
                                fontSize: AppDimensions.FONT_SIZE14),
                          ),
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: controller.resendTheCode,
                              child: const Text(
                                "Resend Code",
                                style: TextStyle(
                                    color: AppColors.BLUE,
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppDimensions.FONT_SIZE14),
                              ),
                            ),
                          ),
                        ],
                      ))
                    ],
                  )),
              Expanded(
                  child: Align(
                alignment: Alignment.center,
                child:
                    CustomActionButton(text: "Next", onTap: controller.verify),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
