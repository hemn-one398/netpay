import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';

class CustomBottomNavBarItem extends StatelessWidget {
  const CustomBottomNavBarItem(
      {super.key,
      required this.iconPath,
      required this.label,
      required this.selected,
      required this.onTap});
  final String iconPath;
  final String label;
  final bool selected;
  final Callback onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDimensions.RADIUS18),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
                height: 24,
                colorFilter: ColorFilter.mode(
                    selected ? Colors.blue : Colors.grey, BlendMode.srcIn),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: AppDimensions.FONT_SIZE12,
                  color: selected ? Colors.blue : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
