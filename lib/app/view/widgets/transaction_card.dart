import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:intl/intl.dart';
import 'package:netspotpay/app/data/enums/transaction_satus_enum.dart';
import 'package:netspotpay/app/model/transaction_model.dart';
import 'package:netspotpay/app/util/constants/app_asset_const.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';
import 'package:netspotpay/app/util/helper.dart';
import 'package:netspotpay/app/view/widgets/icon_card.dart';

class TransactionCard extends StatelessWidget {
  final Callback? onTap;

  const TransactionCard({
    super.key,
    required this.model,
    this.onTap,
  });

  final TransationModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(
          vertical: 25,
        ),
        decoration: BoxDecoration(
          color: AppColors.WHITE,
          border: Border(
            bottom: BorderSide(
              color: AppColors.BLACK.withOpacity(0.1),
            ),
          ),
        ),
        child: Row(children: [
          IconCard(
            cardColor: model.status == TransactionStatus.receive
                ? AppColors.LIGHT_BLUE
                : AppColors.LIGHT_RED,
            iconColor: model.status == TransactionStatus.receive
                ? AppColors.BLUE
                : AppColors.RED,
            iconPath: AppAssets.USER,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(model.username,
                    style: const TextStyle(
                      color: AppColors.BLACK,
                      fontSize: AppDimensions.FONT_SIZE14,
                      fontWeight: FontWeight.bold,
                    )),
                Text(DateFormat("dd MMM yyyy").format(model.date),
                    style: const TextStyle(
                      color: AppColors.LIGHT_BLACK,
                      fontSize: AppDimensions.FONT_SIZE14,
                    )),
              ],
            ),
          )),
          Text("${formatMoney(model.amount)} IQD",
              style: TextStyle(
                color: model.status == TransactionStatus.receive
                    ? AppColors.BLUE
                    : AppColors.RED,
                fontSize: AppDimensions.FONT_SIZE14,
                fontWeight: FontWeight.bold,
              ))
        ]),
      ),
    );
  }
}
