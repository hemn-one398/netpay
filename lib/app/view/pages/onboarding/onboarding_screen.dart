import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netspotpay/app/controllers/onborading/onboarding_controller.dart';
import 'package:netspotpay/app/model/onborading_model.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';
import 'package:netspotpay/app/view/widgets/custom_action_button.dart';
import 'package:sizer/sizer.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OnBoardingController>(builder: (_) {
        return Padding(
          padding: EdgeInsets.symmetric(
              vertical: 10.h, horizontal: AppDimensions.HORIZONTAL_PADDING),
          child: Column(
            children: [
              Expanded(
                  flex: 4,
                  child: PageView.builder(
                      onPageChanged: controller.onPageChanged,
                      itemCount: controller.pages.length,
                      controller: controller.pageController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        OnBoardingModel page = controller.pages[index];
                        return _imageAndTextCard(
                          imagePath: page.imagePath,
                          title: page.title,
                          description: page.description,
                        );
                      })),
              Expanded(
                  child: Align(
                alignment: Alignment.topCenter,
                child: DotsIndicator(
                  dotsCount: controller.pages.length,
                  position: controller.pagePositionValue,
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeColor: Theme.of(Get.context!).colorScheme.primary,
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              )),
              CustomActionButton(
                text:
                    controller.pagePositionValue == controller.pages.length - 1
                        ? "Get Started"
                        : "Next",
                onTap: controller.onTapOnNextButton,
              ),
            ],
          ),
        );
      }),
    );
  }

  _imageAndTextCard({
    required String imagePath,
    required String title,
    required String description,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 3,
            child: Align(
                alignment: Alignment.center, child: Image.asset(imagePath))),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: AppDimensions.FONT_SIZE24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.BLACK),
            ),
          ),
        ),
        Expanded(
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.LIGHT_BLACK,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
