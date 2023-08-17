import 'package:netspotpay/app/data/enums/notification_type_enum.dart';

class NotificationModel {
  NotificationType type;
  String name;
  int amount;

  String? imagePath;

  NotificationModel({
    required this.type,
    required this.name,
    required this.amount,
     this.imagePath,
  });
}
