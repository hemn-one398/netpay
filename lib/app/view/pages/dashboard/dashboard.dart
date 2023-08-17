import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netspotpay/app/controllers/dashboard/dashboard_controller.dart';
import 'package:netspotpay/app/util/constants/app_asset_const.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';
import 'package:netspotpay/app/view/pages/home/home.dart';
import 'package:netspotpay/app/view/pages/inbox/inbox_page.dart';
import 'package:netspotpay/app/view/pages/profile/profile_page.dart';
import 'package:netspotpay/app/view/pages/top_up/top_up_page.dart';
import 'package:netspotpay/app/view/widgets/custom_navigation_bottom_bar/custom_bottom_nav_baritem.dart';
import 'package:netspotpay/app/view/widgets/custom_navigation_bottom_bar/custom_bottom_navigation_bar.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<DashboardController>(
          id: "navbarBuilder",
          builder: (_) {
            return CustomBottomNavigationBar(
                centerFloatingActionButton: FloatingActionButton(
                  elevation: 0,
                  onPressed: controller.scanQrPage,
                  child: SvgPicture.asset(
                    AppAssets.QR_CODE,
                    colorFilter: const ColorFilter.mode(
                      AppColors.WHITE,
                      BlendMode.srcIn,
                    ),
                    height: 30,
                    fit: BoxFit.fill,
                  ),
                ),
                onItemSelected: controller.onNavbarChanged,
                selectedIndex: controller.selectedNavBarItemIndex,
                items: [
                  CustomBottomNavBarItem(
                      iconPath: AppAssets.HOME,
                      label: "Home",
                      onTap: () {
                        controller.onNavbarChanged(0);
                      },
                      selected: controller.selectedNavBarItemIndex == 0),
                  CustomBottomNavBarItem(
                      iconPath: AppAssets.MONEY_WITHDRAW,
                      label: "Top Up",
                      onTap: () {
                        controller.onNavbarChanged(1);
                      },
                      selected: controller.selectedNavBarItemIndex == 1),
                  CustomBottomNavBarItem(
                      iconPath: AppAssets.BELL,
                      label: "Inbox",
                      onTap: () {
                        controller.onNavbarChanged(2);
                      },
                      selected: controller.selectedNavBarItemIndex == 2),
                  CustomBottomNavBarItem(
                      iconPath: AppAssets.USER_CIRCLE,
                      label: "Profile",
                      onTap: () {
                        controller.onNavbarChanged(3);
                      },
                      selected: controller.selectedNavBarItemIndex == 3),
                ]);
          }),
      body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.tabViewController,
          children: const [
            HomePage(),
            TopUpPage(),
            InboxPage(),
            ProfilePage(),
          ]),
    );
  }
}
