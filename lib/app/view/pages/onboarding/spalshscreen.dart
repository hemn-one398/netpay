import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netspotpay/app/util/constants/app_asset_const.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';
import 'package:netspotpay/app/util/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _goToOnBoarding();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BLUE,
      body: Center(
        child: SvgPicture.asset(
          AppAssets.WALLET,
          height: 50,
          colorFilter: const ColorFilter.mode(
            AppColors.WHITE,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  void _goToOnBoarding() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offNamed(AppRoutes.ONBOARDING_PAGE);
  }
}
