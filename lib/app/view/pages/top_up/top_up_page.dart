import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netspotpay/app/controllers/topup/topup_controller.dart';
import 'package:netspotpay/app/util/constants/app_asset_const.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';
import 'package:netspotpay/app/view/widgets/balance_card.dart';
import 'package:netspotpay/app/view/widgets/custom_action_button.dart';
import 'package:netspotpay/app/view/widgets/custom_inputs/custom_textfield.dart';

class TopUpPage extends GetView<TopUpController> {
  const TopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: AppDimensions.HORIZONTAL_PADDING,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BalanceCard(balance: 500000, username: "Hemn Abdulrahman"),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                iconPath: AppAssets.DIALPAD,
                labelText: "Enter Code",
                keyboardType: TextInputType.number,
                validator: controller.codeValidator,
                iconColor: AppColors.LIGHT_BLACK,
                checkColor: AppColors.GREEN,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomActionButton(
                text: "Submit",
                borderRarius: AppDimensions.RADIUS8,
                onTap: controller.submit,
                heught: 45,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.BLACK.withOpacity(0.1),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Or",
                      style: TextStyle(
                        color: AppColors.LIGHT_GREY,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.BLACK.withOpacity(0.1),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomActionButton(
                text: "Scan the QR Code",
                color: AppColors.GREY_COLOR,
                textColor: AppColors.BLACK,
                borderRarius: AppDimensions.RADIUS8,
                fontWeight: FontWeight.normal,
                leading: SvgPicture.asset(
                  AppAssets.QR_CODE,
                  colorFilter: const ColorFilter.mode(
                    AppColors.LIGHT_BLACK,
                    BlendMode.srcIn,
                  ),
                ),
                onTap: controller.scanQrCode,
                heught: 45,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
