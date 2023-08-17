import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netspotpay/app/util/constants/app_asset_const.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';

class CustomLogoAndForgetPasswordWidget extends StatelessWidget {
  const CustomLogoAndForgetPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          AppAssets.WALLET,
          colorFilter: const ColorFilter.mode(
            AppColors.BLUE,
            BlendMode.srcIn,
          ),
          height: 20,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Forgot your credentials?",
            style: TextStyle(
                color: AppColors.BLACK, fontSize: AppDimensions.FONT_SIZE14),
          ),
        )
      ],
    );
  }
}
