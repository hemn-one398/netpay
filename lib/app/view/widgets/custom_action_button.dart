import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';
import 'package:sizer/sizer.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({
    super.key,
    required this.text,
    this.color,
    this.textColor,
    required this.onTap,
    this.icon,
    this.heught,
    this.leading,
    this.borderRarius,
    this.fontWeight,
  });
  final String text;
  final Color? color;
  final Color? textColor;
  final Callback onTap;
  final Widget? icon;
  final double? heught;
  final Widget? leading;
  final double? borderRarius;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color ?? AppColors.BLUE,
          borderRadius:
              BorderRadius.circular(borderRarius ?? AppDimensions.RADIUS12)),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius:
              BorderRadius.circular(borderRarius ?? AppDimensions.RADIUS12),
          onTap: onTap,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: heught ?? 60,
              width: 100.w,
              child: Row(
                children: [
                  leading ?? Container(),
                  Expanded(
                    child: Align(
                      child: icon ??
                          Text(
                            text,
                            style: TextStyle(
                              color: textColor ?? AppColors.WHITE,
                              fontSize: AppDimensions.FONT_SIZE16,
                              fontWeight: fontWeight ?? FontWeight.bold,
                            ),
                          ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
