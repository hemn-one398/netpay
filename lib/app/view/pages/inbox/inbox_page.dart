import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netspotpay/app/controllers/inbox/inbox_controller.dart';
import 'package:netspotpay/app/model/notification_model.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';
import 'package:netspotpay/app/view/widgets/custom_divder.dart';
import 'package:netspotpay/app/view/widgets/notification_card.dart';

class InboxPage extends GetView<InboxController> {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          _padding(
            child: _titleText("New Notifications"),
          ),
          const CustomDivider(
            height: 0,
          ),
          _padding(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.newNotificationList.length,
              itemBuilder: (context, index) {
                final NotificationModel notification =
                    controller.newNotificationList[index];

                return NotificationCard(notification: notification);
              },
            ),
          ),
          _padding(
            child: _titleText("Earlier Notification"),
          ),
          const CustomDivider(
            height: 0,
          ),
          _padding(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.earlierNotificationList.length,
              itemBuilder: (context, index) {
                final NotificationModel notification =
                    controller.earlierNotificationList[index];

                return NotificationCard(notification: notification);
              },
            ),
          ),
        ],
      ),
    );
  }

  Text _titleText(text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: AppDimensions.FONT_SIZE16,
          fontWeight: FontWeight.bold,
          color: AppColors.BLACK),
    );
  }

  Padding _padding({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: AppDimensions.HORIZONTAL_PADDING,
      ),
      child: child,
    );
  }
}
