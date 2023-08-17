import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';

class IconCard extends StatelessWidget {
  const IconCard({
    super.key,
    required this.cardColor,
    required this.iconColor,
    this.height,
    this.width,
    required this.iconPath,
    this.iconHeight,
    this.iconWidth,
  });
  final Color cardColor;
  final Color iconColor;
  final double? height, width, iconHeight, iconWidth;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 45,
        width: width ?? 45,
        decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(
              AppDimensions.RADIUS12,
            )),
        child: SvgPicture.asset(iconPath,
            fit: BoxFit.none,
            height: iconHeight,
            width: iconWidth,
            colorFilter: ColorFilter.mode(
              iconColor,
              BlendMode.srcIn,
            )));
  }
}
