import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:netspotpay/app/controllers/auth/register_controller.dart';
import 'package:netspotpay/app/util/constants/app_asset_const.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';
import 'package:netspotpay/app/util/helper.dart';
import 'package:netspotpay/app/view/widgets/custom_action_button.dart';
import 'package:netspotpay/app/view/widgets/custom_container_shape.dart';
import 'package:netspotpay/app/view/widgets/icon_card.dart';
import 'package:netspotpay/app/view/widgets/scroll_column_expandable.dart';
import 'package:sizer/sizer.dart';

class IdentificationPage extends GetView<RegisterController> {
  const IdentificationPage({super.key});

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
                      Icons.arrow_back_ios_rounded,
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
          AppAssets.R_LOGO,
          height: 50,
          colorFilter: const ColorFilter.mode(
            AppColors.WHITE,
            BlendMode.srcIn,
          ),
        ),
        child: GetBuilder<RegisterController>(builder: (_) {
          return ScrollColumnExpandable(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  "Almost There!",
                  style: TextStyle(
                    color: AppColors.BLACK,
                    fontWeight: FontWeight.bold,
                    fontSize: AppDimensions.FONT_SIZE24,
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              const Text(
                "Identification",
                style: TextStyle(
                  color: AppColors.BLACK,
                  fontWeight: FontWeight.bold,
                  fontSize: AppDimensions.FONT_SIZE14,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Please provide each photo as requested below:",
                style: TextStyle(
                  color: AppColors.LIGHT_BLACK,
                  fontSize: AppDimensions.FONT_SIZE14,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: controller.photoList.asMap().entries.map((entry) {
                  final index = entry.key;
                  final photoModel = entry.value;

                  return _photoCard(
                    title: photoModel.title,
                    iconPath: photoModel.iconPath,
                    onTap: () {
                      controller.takePhoto(photoModel);
                    },
                    // if previous photo is not null then  enable the next button
                    enable: index == 0 ||
                        (index > 0 &&
                            controller.photoList[index - 1].photo != null),
                    isUploaded: photoModel.photo != null,
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Documentation",
                style: TextStyle(
                  color: AppColors.BLACK,
                  fontWeight: FontWeight.bold,
                  fontSize: AppDimensions.FONT_SIZE14,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              _uploadCard(
                  title: "Passport",
                  detail: "Must be clear, readable and high quality",
                  iconPath: AppAssets.PASSPORT,
                  isUploaded: controller.passportFile != null,
                  onTap: () {
                    controller.uploadPassport();
                  }),
              const SizedBox(
                height: 14,
              ),
              _uploadCard(
                  title: "Personal ID Card",
                  detail: "Must be clear, readable and high quality",
                  iconPath: AppAssets.USER,
                  isUploaded: controller.personalIDCardFile != null,
                  onTap: () {
                    controller.uploadPersonalID();
                  }),
              const SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: CustomActionButton(
                    text: "Next", onTap: controller.goToOtpPage),
              ),
              keyboardBottomSpace(context),
            ],
          );
        }));
  }

  DottedBorder _uploadCard({
    required String title,
    required String detail,
    required String iconPath,
    required VoidCallback onTap,
    required bool isUploaded,
  }) {
    return DottedBorder(
      borderType: BorderType.RRect,
      strokeCap: StrokeCap.square,
      dashPattern: const [2, 6],
      strokeWidth: 2,
      color: AppColors.BORDER_COLOR,
      radius: const Radius.circular(AppDimensions.RADIUS12),
      padding: const EdgeInsets.all(6),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 180,
          width: 100.w,
          color: Colors.white,
          child: Column(children: [
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconCard(
                  iconPath: iconPath,
                  iconColor: AppColors.BLUE,
                  cardColor: AppColors.LIGHT_BLUE,
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              color: AppColors.BLACK,
                              fontSize: AppDimensions.FONT_SIZE14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: Text(
                              detail,
                              maxLines: 2,
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            )),
            SizedBox(
              height: 50,
              child: CustomActionButton(
                text: "Upload",
                icon: isUploaded
                    ? SvgPicture.asset(
                        AppAssets.CHECK_CIRCLE,
                      )
                    : null,
                onTap: onTap,
                color:
                    isUploaded ? AppColors.LIGHT_GREEN : AppColors.GREY_COLOR,
                textColor: AppColors.BLACK,
              ),
            )
          ]),
        ),
      ),
    );
  }

  Column _photoCard({
    required String iconPath,
    required String title,
    required VoidCallback onTap,
    required bool isUploaded,
    required bool enable,
  }) {
    return Column(
      children: [
        Container(
          height: 120,
          width: 100,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.GREY_COLOR,
            borderRadius: BorderRadius.circular(AppDimensions.RADIUS8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                iconPath,
                height: 55,
              ),
              Text(title,
                  style: const TextStyle(
                    color: AppColors.BLACK,
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        SizedBox(
          width: 100,
          child: IconButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    isUploaded ? AppColors.LIGHT_GREEN : AppColors.GREY_COLOR,
                  ),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ))),
              onPressed: enable ? onTap : null,
              icon: Opacity(
                opacity: enable ? 1 : 0.5,
                child: SvgPicture.asset(
                  isUploaded ? AppAssets.CHECK_CIRCLE : AppAssets.CAMERA_PLUS,
                ),
              )),
        ),
      ],
    );
  }
}
