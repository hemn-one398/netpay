import 'package:netspotpay/app/data/enums/transaction_satus_enum.dart';

class TransationModel {
  String username;
  int amount;
  DateTime date;
  TransactionStatus status;
  TransationModel(
      {required this.username,
      required this.amount,
      required this.date,
      required this.status});
}
