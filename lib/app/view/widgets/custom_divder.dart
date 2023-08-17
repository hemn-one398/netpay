import 'package:flutter/material.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.height});
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      color: AppColors.BLACK.withOpacity(0.1),
    );
  }
}
