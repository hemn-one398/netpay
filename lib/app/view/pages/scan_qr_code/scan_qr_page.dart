import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:netspotpay/app/controllers/scan_qr_code/scan_qr_code_controller.dart';
import 'package:netspotpay/app/util/constants/app_asset_const.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';
import 'package:netspotpay/app/view/pages/scan_qr_code/qr_camera.dart';
import 'package:netspotpay/app/view/widgets/custom_action_button.dart';
import 'package:netspotpay/app/view/widgets/custom_container_shape.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sizer/sizer.dart';

class ScanQrPage extends GetView<ScanQrCodeController> {
  const ScanQrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerCircleOnTopShape(
      topSection: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.HORIZONTAL_PADDING,
          ),
          width: 100.w,
          height: 100.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.close)),
            ],
          ),
        ),
      ),
      icon: SvgPicture.asset(
        AppAssets.QR_CODE,
        colorFilter: const ColorFilter.mode(
          AppColors.WHITE,
          BlendMode.srcIn,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.HORIZONTAL_PADDING,
        ),
        child: Theme(
            data: ThemeData(useMaterial3: false),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  width: 100.w,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: AppColors.BORDER_COLOR, width: 1)),
                    ),
                    child: TabBar(
                      indicatorColor: AppColors.BLUE,
                      indicator: UnderlineTabIndicator(
                          borderSide: const BorderSide(
                              color: AppColors.BLUE, width: 1.5),
                          borderRadius: BorderRadius.circular(
                            24,
                          )),
                      unselectedLabelColor: AppColors.BLACK,
                      labelColor: AppColors.BLUE,
                      controller: controller.tabViewrController,
                      padding: EdgeInsets.zero,
                      labelPadding: EdgeInsets.zero,
                      tabs: const [
                        Tab(
                          text: "Receive",
                        ),
                        Tab(
                          text: "Send",
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: controller.tabViewrController,
                        children: [
                      _page(
                        globalKey: controller.receiveQrKey,
                        result: controller.receiveResult,
                        enterManually: controller.enterManually,
                        qrController: controller.receiveQrCamController,
                      ),
                      _page(
                        globalKey: controller.sendQrKey,
                        result: controller.sendResult,
                        enterManually: controller.enterManually,
                        qrController: controller.sendQrCamController,
                      ),
                    ]))
              ],
            )),
      ),
    );
  }

  _page({
    required GlobalKey globalKey,
    required QRViewController? qrController,
    required Barcode? result,
    required Callback enterManually,
  }) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: 280,
              width: 100.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                // Not working on Simulator :()
                child: QrCamera(
                  globalKey: globalKey,
                  qrViewController: qrController,
                  result: result,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: AppColors.BLUE,
                )),
            const SizedBox(
              height: 40,
            ),
            CustomActionButton(text: "Enter Manually", onTap: enterManually)
          ],
        ),
      ),
    );
  }
}
