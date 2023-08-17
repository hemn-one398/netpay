import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:netspotpay/app/bindings/initial_bindings.dart';
import 'package:netspotpay/app/util/routes/pages.dart';
import 'package:netspotpay/app/util/theme/light_theme.dart';
import 'package:netspotpay/app/view/pages/onboarding/spalshscreen.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'NetSpotPay',
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        initialBinding: InitialBindigs(),
        getPages: AppPages.pages,
        home: const SplashScreen(),
      );
    });
  }
}
