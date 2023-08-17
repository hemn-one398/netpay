import 'package:flutter/material.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';
import 'package:sizer/sizer.dart';

class InputSkin extends StatelessWidget {
  const InputSkin({
    super.key,
    required this.child,
    required this.label,
  });
  final Widget child;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: AppDimensions.FONT_SIZE14,
              color: AppColors.LIGHT_BLACK,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            width: 100.w,
            padding: const EdgeInsets.only(
              right: 10,
              left: 2,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.GREY_COLOR),
            child: child,
          ),
        ],
      ),
    );
  }
}
