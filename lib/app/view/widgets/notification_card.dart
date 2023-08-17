import 'package:flutter/material.dart';
import 'package:netspotpay/app/data/enums/notification_type_enum.dart';
import 'package:netspotpay/app/model/notification_model.dart';
import 'package:netspotpay/app/util/constants/app_asset_const.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';
import 'package:netspotpay/app/util/helper.dart';
import 'package:netspotpay/app/view/widgets/icon_card.dart';
import 'package:netspotpay/app/view/widgets/text_card.dart';
import 'package:netspotpay/app/view/widgets/user_profile_image_card.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.notification,
  });

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    final bool isSendMoney = notification.type == NotificationType.sendMoney;
    final bool isRequestMoney =
        notification.type == NotificationType.moneyRequest;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.WHITE,
        border: Border(
          bottom: BorderSide(
            color: AppColors.BLACK.withOpacity(0.1),
          ),
        ),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        isRequestMoney
            ? UserProfileImageCard(imagePath: notification.imagePath!)
            : IconCard(
                height: 50,
                width: 50,
                cardColor:
                    isSendMoney ? AppColors.LIGHT_RED : AppColors.LIGHT_BLUE,
                iconColor: isSendMoney ? AppColors.RED : AppColors.BLUE,
                iconPath: isSendMoney
                    ? AppAssets.MONEY_INSERT
                    : AppAssets.MONEY_WITHDRAW,
              ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                notification.type.toShortString(),
                style: const TextStyle(
                  fontSize: AppDimensions.FONT_SIZE16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text.rich(
                (() {
                  switch (notification.type) {
                    case NotificationType.sendMoney:
                      {
                        return TextSpan(children: [
                          TextSpan(
                              text:
                                  "You sent ${formatMoney(notification.amount)} IQD to ",
                              children: [
                                TextSpan(
                                    text: notification.name,
                                    style: const TextStyle(
                                      color: AppColors.BLUE,
                                      fontWeight: FontWeight.bold,
                                    )),
                                const TextSpan(text: " via transfer.")
                              ])
                        ]);
                      }
                    case NotificationType.receiviedMoney:
                      {
                        return TextSpan(children: [
                          TextSpan(
                              text: notification.name,
                              style: const TextStyle(
                                color: AppColors.BLUE,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text:
                                  " sent ${formatMoney(notification.amount)} IQD to ",
                              children: const [
                                TextSpan(text: " via transfer.")
                              ])
                        ]);
                      }
                    case NotificationType.moneyRequest:
                      {
                        return TextSpan(children: [
                          TextSpan(
                              text: notification.name,
                              style: const TextStyle(
                                color: AppColors.BLUE,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                            text:
                                " requested ${formatMoney(notification.amount)} IQD.",
                          )
                        ]);
                      }
                  }
                }()),
                style: const TextStyle(
                  fontSize: AppDimensions.FONT_SIZE14,
                ),
              ),
              notification.type == NotificationType.moneyRequest
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: const SizedBox(
                              height: 40,
                              width: 80,
                              child: TextCard(
                                  fontWeight: FontWeight.bold,
                                  textColor: AppColors.BLUE,
                                  cardColor: AppColors.LIGHT_BLUE,
                                  text: "Details"),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const SizedBox(
                              height: 40,
                              width: 80,
                              child: TextCard(
                                  fontWeight: FontWeight.bold,
                                  textColor: AppColors.RED,
                                  cardColor: AppColors.LIGHT_RED,
                                  text: "Decline"),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ))
      ]),
    );
  }
}
