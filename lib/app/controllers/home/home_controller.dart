import 'package:get/get.dart';
import 'package:netspotpay/app/data/enums/transaction_satus_enum.dart';
import 'package:netspotpay/app/model/transaction_model.dart';

class HomeController extends GetxController {
  List<TransationModel> recentTransactions = [
    TransationModel(
        username: "John Doe",
        amount: -100000,
        date: DateTime.now(),
        status: TransactionStatus.send),
    TransationModel(
        username: "Jane Doe",
        amount: 50000,
        date: DateTime.now(),
        status: TransactionStatus.receive),
    TransationModel(
        username: "John Doe",
        amount: -100000,
        date: DateTime.now(),
        status: TransactionStatus.send)
  ];

  void receive() {}

  void deposit() {}

  void withdraw() {}

  void history() {}

  void send() {}
}
