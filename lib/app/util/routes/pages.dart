import 'package:get/route_manager.dart';

import 'package:netspotpay/app/bindings/auth/otp_binding.dart';
import 'package:netspotpay/app/bindings/auth/register_binding.dart';
import 'package:netspotpay/app/bindings/auth/signin_binding.dart';
import 'package:netspotpay/app/bindings/dashboard/dashboard_binding.dart';
import 'package:netspotpay/app/bindings/onboarding/onboarding_binding.dart';
import 'package:netspotpay/app/bindings/scan_qr_code/scan_qr_binding.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';
import 'package:netspotpay/app/util/routes/routes.dart';
import 'package:netspotpay/app/view/pages/auth/identification_page.dart';
import 'package:netspotpay/app/view/pages/auth/otp_page.dart';
import 'package:netspotpay/app/view/pages/auth/register_page.dart';
import 'package:netspotpay/app/view/pages/auth/signin_page.dart';
import 'package:netspotpay/app/view/pages/dashboard/dashboard.dart';
import 'package:netspotpay/app/view/pages/onboarding/onboarding_screen.dart';
import 'package:netspotpay/app/view/pages/scan_qr_code/scan_qr_page.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
        name: AppRoutes.ONBOARDING_PAGE,
        page: () => const OnBoardingScreen(),
        binding: OnBoardingBinding(),
        transitionDuration:
            const Duration(milliseconds: AppDimensions.DURATION300),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.SIGNIN_PAGE,
        page: () => const SignInPage(),
        binding: SignInBinding(),
        transitionDuration:
            const Duration(milliseconds: AppDimensions.DURATION300),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.OTP_PAGE,
        page: () => const OtpPage(),
        binding: OtpBinding(),
        transitionDuration:
            const Duration(milliseconds: AppDimensions.DURATION300),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.REGISTER_PAGE,
        page: () => const RegisterPage(),
        binding: RegisterBinding(),
        transitionDuration:
            const Duration(milliseconds: AppDimensions.DURATION300),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.IDENTIFICATION_PAGE,
        page: () => const IdentificationPage(),
        transitionDuration:
            const Duration(milliseconds: AppDimensions.DURATION300),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.DASHBOARD,
        page: () => const DashboardPage(),
        binding: DashBoardBinding(),
        transitionDuration:
            const Duration(milliseconds: AppDimensions.DURATION300),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.SCAN_QR_PAGE,
        page: () => const ScanQrPage(),
        binding: ScanQrCodeBinding(),
        transitionDuration:
            const Duration(milliseconds: AppDimensions.DURATION300),
        transition: Transition.fadeIn),
  ];
}
