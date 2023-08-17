import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netspotpay/app/controllers/home/home_controller.dart';
import 'package:netspotpay/app/model/transaction_model.dart';
import 'package:netspotpay/app/util/constants/app_asset_const.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';
import 'package:netspotpay/app/view/widgets/balance_card.dart';
import 'package:netspotpay/app/view/widgets/custom_divder.dart';
import 'package:netspotpay/app/view/widgets/icon_card.dart';
import 'package:netspotpay/app/view/widgets/icon_text_button.dart';
import 'package:netspotpay/app/view/widgets/text_card.dart';
import 'package:netspotpay/app/view/widgets/transaction_card.dart';
import 'package:sizer/sizer.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // support expadable children and it's scrollable
      body: SafeArea(
        child: ListView(
          children: [
            _padding(child: _cardAndButtonsSection()),
            const CustomDivider(),
            _padding(child: _recentTransactions()),
            const CustomDivider(),
            _padding(child: _billPaySection()),
            const CustomDivider(),
            _padding(child: _shop())
          ],
        ),
      ),
    );
  }

  _shop() {
    return SizedBox(
      height: 180,
      width: 100.w,
      child: Column(
        children: [
          Row(
            children: [
              _homeCardTitle(title: "Shop"),
              const SizedBox(
                width: 16,
              ),
              const TextCard(
                cardColor: AppColors.LIGHT_BLUE,
                textColor: AppColors.BLUE,
                text: "Coming soon",
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.BLUE,
              borderRadius: BorderRadius.circular(
                AppDimensions.RADIUS12,
              ),
            ),
            child: Row(
              children: [
                const Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Shop",
                      style: TextStyle(
                        color: AppColors.WHITE,
                        fontSize: AppDimensions.FONT_SIZE28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Coming soon",
                      style: TextStyle(
                        color: AppColors.WHITE,
                        fontSize: AppDimensions.FONT_SIZE16,
                      ),
                    )
                  ],
                )),
                Expanded(
                    child: SvgPicture.asset(
                  AppAssets.SHOPPING_CART,
                  height: 50,
                  colorFilter: const ColorFilter.mode(
                    AppColors.WHITE,
                    BlendMode.srcIn,
                  ),
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }

  Text _homeCardTitle({required String title}) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: AppDimensions.FONT_SIZE16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _billPaySection() {
    return SizedBox(
      height: 200,
      width: 100.w,
      child: Column(
        children: [
          Row(
            children: [
              _homeCardTitle(title: "Bill Pay"),
              const SizedBox(
                width: 16,
              ),
              const TextCard(
                cardColor: AppColors.LIGHT_BLUE,
                textColor: AppColors.BLUE,
                text: "Coming soon",
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _billPayCard(
                cardColor: AppColors.LIGHT_GREEN,
                iconColor: AppColors.GREEN,
                text: "Electricity",
                iconPath: AppAssets.LIGHTBULB,
              ),
              _billPayCard(
                cardColor: AppColors.LIGHT_PURPLE,
                iconColor: AppColors.PURPLE,
                text: "Water",
                iconPath: AppAssets.TEAR,
              ),
              _billPayCard(
                cardColor: AppColors.LIGHT_BLUE,
                iconColor: AppColors.BLUE,
                text: "Internet",
                iconPath: AppAssets.WIFI,
              ),
              _billPayCard(
                cardColor: AppColors.LIGHT_RED,
                iconColor: AppColors.RED,
                text: "Televison",
                iconPath: AppAssets.TV_RETRO,
              ),
            ],
          ))
        ],
      ),
    );
  }

  _billPayCard({
    required Color cardColor,
    required Color iconColor,
    required String iconPath,
    required String text,
  }) {
    return Opacity(
      opacity: 0.5,
      child: Column(children: [
        IconCard(
          width: 70,
          height: 70,
          cardColor: cardColor,
          iconColor: iconColor,
          iconPath: iconPath,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: const TextStyle(
            color: AppColors.BLACK,
          ),
        ),
      ]),
    );
  }

  Padding _padding({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: AppDimensions.HORIZONTAL_PADDING,
      ),
      child: child,
    );
  }

  Column _recentTransactions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _homeCardTitle(title: "Recent Transaction"),
        ListView.builder(
          itemCount: controller.recentTransactions.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            TransationModel model = controller.recentTransactions[index];
            return TransactionCard(
              model: model,
              onTap: () {},
            );
          },
        )
      ],
    );
  }

  Column _cardAndButtonsSection() {
    return Column(
      children: [
        const BalanceCard(
          balance: 450000,
          username: "Hemn Abdulrahman",
        ),
        const SizedBox(
          height: 20,
        ),
        Row(children: [
          Expanded(
            child: IconTextButton(
              axis: Axis.horizontal,
              text: "Send",
              height: 70,
              iconColor: AppColors.BLUE,
              color: AppColors.LIGHT_BLUE,
              textColor: AppColors.BLUE,
              onTap: controller.send,
              iconPath: AppAssets.MONEY_INSERT,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: IconTextButton(
              axis: Axis.horizontal,
              text: "Receive",
              height: 70,
              iconColor: AppColors.BLUE,
              color: AppColors.LIGHT_BLUE,
              textColor: AppColors.BLUE,
              onTap: controller.receive,
              iconPath: AppAssets.MONEY_WITHDRAW,
            ),
          )
        ]),
        const SizedBox(
          height: 16,
        ),
        Row(children: [
          Expanded(
            child: IconTextButton(
              axis: Axis.vertical,
              text: "Deposit",
              height: 70,
              iconColor: AppColors.BLUE,
              color: AppColors.GREY_COLOR,
              textColor: AppColors.BLACK,
              onTap: controller.deposit,
              iconPath: AppAssets.MONEY_WITHDRAWAL,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: IconTextButton(
              axis: Axis.vertical,
              text: "Withdraw",
              height: 70,
              iconColor: AppColors.BLUE,
              color: AppColors.GREY_COLOR,
              textColor: AppColors.BLACK,
              onTap: controller.withdraw,
              iconPath: AppAssets.MONEY_WITHDRAWAL,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: IconTextButton(
              axis: Axis.vertical,
              text: "History",
              height: 70,
              iconColor: AppColors.BLUE,
              color: AppColors.GREY_COLOR,
              textColor: AppColors.BLACK,
              onTap: controller.history,
              iconPath: AppAssets.CLOCK,
            ),
          ),
        ]),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
