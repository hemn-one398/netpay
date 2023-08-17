import 'package:flutter/material.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';
import 'package:sizer/sizer.dart';

class CustomContainerCircleOnTopShape extends StatelessWidget {
  const CustomContainerCircleOnTopShape({
    super.key,
    required this.icon,
    required this.child,
    required this.topSection,
  });
  final Widget icon;
  final Widget child;
  final Widget topSection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.LIGHT_BLUE,
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Positioned(
              top: 0,
              height: 16.h,
              width: 100.w,
              child: Container(
                // padding: EdgeInsets.symmetric(
                //     horizontal: AppDimensions.HORIZONTAL_PADDING),
                decoration: BoxDecoration(
                  color: AppColors.LIGHT_BLUE,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: SafeArea(child: topSection),
              ),
            ),
            Positioned(
              height: 80.h,
              width: 100.w,
              child: Container(
                padding: const EdgeInsets.only(
                    left: AppDimensions.HORIZONTAL_PADDING / 2,
                    right: AppDimensions.HORIZONTAL_PADDING / 2,
                    // 60 is more the the size of CircleAvatar which is 50
                    top: 60),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, -2),
                      blurRadius: 12,
                      color: Colors.black.withOpacity(0.05),
                    )
                  ],
                  color: AppColors.WHITE,
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(AppDimensions.RADIUS24)),
                ),
                child: child,
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 75.h,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.WHITE,
                child: CircleAvatar(
                  backgroundColor: AppColors.BLUE,
                  radius: 45,
                  child: icon,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
