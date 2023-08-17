import 'package:flutter/material.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';

class UserProfileImageCard extends StatelessWidget {
  const UserProfileImageCard({
    super.key,
    required this.imagePath,
  });
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      padding: const EdgeInsets.only(
        top: 6,
        left: 6,
        right: 6,
        bottom: 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.LIGHT_BLUE,
        borderRadius: BorderRadius.circular(AppDimensions.RADIUS12),
      ),
      child: Image.network(
        imagePath,
        height: 40,
      ),
    );
  }
}
