enum NotificationType { sendMoney, receiviedMoney, moneyRequest }

extension ParseToString on NotificationType {
  String toShortString() {
    switch (this) {
      case NotificationType.sendMoney:
        return "Send Money";
      case NotificationType.receiviedMoney:
        return "Receive Money";
      case NotificationType.moneyRequest:
        return "Money Request";
    }
  }
}
