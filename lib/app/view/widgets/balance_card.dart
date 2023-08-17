import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netspotpay/app/util/constants/app_asset_const.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';
import 'package:netspotpay/app/util/helper.dart';
import 'package:sizer/sizer.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
    required this.balance,
    required this.username,
  });

  final int balance;
  final String username;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 100.w,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.RADIUS18),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.2,
                0.9,
              ],
              colors: [
                AppColors.BLUE,
                Color(0xff0362AA)
              ])),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Your Balance",
                style: TextStyle(
                  color: AppColors.GREY_COLOR.withOpacity(0.8),
                  fontSize: AppDimensions.FONT_SIZE16,
                  fontWeight: FontWeight.bold,
                )),
            SvgPicture.asset(
              AppAssets.WALLET,
              height: 25,
              colorFilter: const ColorFilter.mode(
                AppColors.WHITE,
                BlendMode.srcIn,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text("${formatMoney(balance)} IQD",
            style: const TextStyle(
              color: AppColors.WHITE,
              fontSize: AppDimensions.FONT_SIZE24,
              fontWeight: FontWeight.bold,
            )),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Username",
                style: TextStyle(
                  color: AppColors.GREY_COLOR.withOpacity(0.8),
                  fontSize: AppDimensions.FONT_SIZE16,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 10,
            ),
            Text(username,
                style: const TextStyle(
                  color: AppColors.WHITE,
                  fontSize: AppDimensions.FONT_SIZE18,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ))
      ]),
    );
  }
}
