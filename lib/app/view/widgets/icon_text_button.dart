import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onTap,
    required this.iconPath,
    required this.axis,
    required this.iconColor,
    this.height,
    this.width,
  });
  final String text;
  final Color color;
  final Color iconColor;
  final Color textColor;
  final Callback onTap;
  final String iconPath;
  final Axis axis;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.RADIUS12),
            color: color),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: BorderRadius.circular(AppDimensions.RADIUS12),
            onTap: onTap,
            child: SizedBox(
                height: height,
                width: width,
                child: axis == Axis.horizontal
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            SvgPicture.asset(
                              iconPath,
                              height: 20,
                              colorFilter: ColorFilter.mode(
                                iconColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(text,
                                style: TextStyle(
                                  height: 1.3,
                                  fontSize: AppDimensions.FONT_SIZE16,
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                ))
                          ])
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            SvgPicture.asset(
                              iconPath,
                              height: 20,
                              colorFilter: ColorFilter.mode(
                                iconColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(text,
                                style: TextStyle(
                                  height: 1.3,
                                  fontSize: AppDimensions.FONT_SIZE14,
                                  color: textColor,
                                ))
                          ])),
          ),
        ));
  }
}
