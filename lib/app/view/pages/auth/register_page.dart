import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netspotpay/app/controllers/auth/register_controller.dart';
import 'package:netspotpay/app/model/city_model.dart';
import 'package:netspotpay/app/model/gender_model.dart';
import 'package:netspotpay/app/util/constants/app_asset_const.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';
import 'package:netspotpay/app/util/helper.dart';
import 'package:netspotpay/app/view/widgets/custom_action_button.dart';
import 'package:netspotpay/app/view/widgets/custom_container_shape.dart';
import 'package:netspotpay/app/view/widgets/custom_inputs/custom_dropdown.dart';
import 'package:netspotpay/app/view/widgets/custom_inputs/custom_textfield.dart';
import 'package:netspotpay/app/view/widgets/scroll_column_expandable.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerCircleOnTopShape(
        topSection: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.HORIZONTAL_PADDING, vertical: 20),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.close,
                    )),
                Text.rich(TextSpan(
                  children: [
                    const TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                          color: AppColors.BLACK,
                          fontSize: AppDimensions.FONT_SIZE14),
                    ),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: controller.goToSignInPage,
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                              color: AppColors.PURPLE,
                              fontSize: AppDimensions.FONT_SIZE14),
                        ),
                      ),
                    ),
                  ],
                ))
              ]),
        ),
        icon: SvgPicture.asset(
          AppAssets.WALLET,
          height: 30,
          colorFilter: const ColorFilter.mode(
            AppColors.WHITE,
            BlendMode.srcIn,
          ),
        ),
        child: ScrollColumnExpandable(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Getting Started",
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
              "Create an account to continue!",
              style: TextStyle(
                color: AppColors.LIGHT_BLACK,
                fontSize: AppDimensions.FONT_SIZE14,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            CustomTextField(
              iconPath: AppAssets.USER_CIRCLE,
              textEditingController: controller.fullNameController,
              labelText: "Full Name",
            ),
            CustomTextField(
              iconPath: AppAssets.USER,
              textEditingController: controller.usernameController,
              labelText: "Username",
              validator: controller.userNameValidator,
            ),
            CustomTextField(
              iconPath: AppAssets.EMAIL,
              textEditingController: controller.emailController,
              labelText: "Email",
              validator: controller.emailValidator,
            ),
            CustomTextField(
              iconPath: AppAssets.LOCK,
              textEditingController: controller.passwordController,
              labelText: "Password",
              isPasswordField: true,
            ),
            CustomTextField(
              iconPath: AppAssets.LOCK,
              textEditingController: controller.confirmPasswordController,
              labelText: "Confirm Password",
              isPasswordField: true,
              validator: controller.confirmPassValidator, //
            ),
            CustomDropDown<CityModel>(
              labelText: "City",
              hintText: "Select City",
              iconPath: AppAssets.USER_LOCATION,
              value: controller.selectedCity,
              items: controller.cities,
              onChanged: controller.onCitySelected,
            ),
            CustomDropDown<GenderModel>(
              labelText: "Gender",
              hintText: "Select Gender",
              iconPath: AppAssets.USERS,
              value: controller.selectedGender,
              items: controller.gender,
              onChanged: controller.onGenderSelected,
            ),
            GetBuilder<RegisterController>(
                id: "dateOfBirthBuilder",
                builder: (_) {
                  return CustomTextField(
                    iconPath: AppAssets.CALENDAR,
                    readOnly: true,
                    onTap: () => _showDatePicker(context),

                    textEditingController: controller.birthDateController,
                    labelText: "Date of Birth",

                    validator: controller.confirmPassValidator, //
                  );
                }),
            Row(children: [
              GetBuilder<RegisterController>(
                  id: "agreeToTermsBuilder",
                  builder: (_) {
                    return Checkbox(
                        value: controller.agreeToTerms,
                        onChanged: controller.onAgreeChanged);
                  }),
              Expanded(
                child: Text.rich(
                    maxLines: 2,
                    TextSpan(
                        style: const TextStyle(
                            fontSize: AppDimensions.FONT_SIZE14),
                        children: [
                          const TextSpan(
                              text: "By creating an account, you agree to our ",
                              style: TextStyle(
                                color: AppColors.LIGHT_BLACK,
                              )),
                          WidgetSpan(
                              child: GestureDetector(
                            onTap: controller.goToTermsPage,
                            child: const Text("Terms & Conditions",
                                style: TextStyle(
                                  color: AppColors.BLUE,
                                )),
                          )),
                        ])),
              )
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: CustomActionButton(
                  text: "Next", onTap: controller.goToIdentificationPage),
            ),
            keyboardBottomSpace(context),
          ],
        ));
  }

  Future<void> _showDatePicker(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != controller.selectedDate) {
      controller.setDate(picked);
    }
  }
}
