import 'package:get/get.dart';
import 'package:netspotpay/app/data/enums/notification_type_enum.dart';
import 'package:netspotpay/app/model/notification_model.dart';

class InboxController extends GetxController {
  List<NotificationModel> newNotificationList = [
    NotificationModel(
      type: NotificationType.sendMoney,
      name: "Hemn Doe",
      amount: 300000,
    ),
    NotificationModel(
      type: NotificationType.moneyRequest,
      name: "AHmad Doe",
      amount: 200000,
      imagePath:
          "https://static.vecteezy.com/system/resources/previews/009/397/892/original/woman-face-expression-clipart-design-illustration-free-png.png",
    ),
    NotificationModel(
      type: NotificationType.receiviedMoney,
      name: "Nasrin Doe",
      amount: 100000,
    ),
  ];
  List<NotificationModel> earlierNotificationList = [
    NotificationModel(
      type: NotificationType.sendMoney,
      name: "Hassan Doe",
      amount: 400000,
    ),
    NotificationModel(
      type: NotificationType.receiviedMoney,
      name: "Jhon Doe",
      amount: 100000,
    ),
    NotificationModel(
      type: NotificationType.moneyRequest,
      name: "Ali Doe",
      amount: 100000,
      imagePath:
          "https://static.vecteezy.com/system/resources/previews/009/397/892/original/woman-face-expression-clipart-design-illustration-free-png.png",
    ),
    NotificationModel(
      type: NotificationType.sendMoney,
      name: "Hassan Doe",
      amount: 400000,
    ),
    NotificationModel(
      type: NotificationType.receiviedMoney,
      name: "Jhon Doe",
      amount: 100000,
    ),
  ];
}
