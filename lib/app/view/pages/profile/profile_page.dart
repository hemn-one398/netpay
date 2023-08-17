import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:netspotpay/app/controllers/profile/profile_controller.dart';
import 'package:netspotpay/app/util/constants/app_asset_const.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';
import 'package:netspotpay/app/view/widgets/custom_divder.dart';
import 'package:netspotpay/app/view/widgets/text_card.dart';
import 'package:netspotpay/app/view/widgets/user_profile_image_card.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.PROFILE_BACKGROUND_COLOR,
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.HORIZONTAL_PADDING),
      child: SafeArea(
        child: Column(
          children: [
            _customAppBar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _userProfileCardSection(),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: AppColors.WHITE,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.RADIUS12,
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Text(
                                "General",
                                style: TextStyle(
                                  color: AppColors.BLACK,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const CustomDivider(
                              height: 0,
                            ),
                            Column(
                              children: [
                                _optionCard(
                                  iconColor: AppColors.PURPLE,
                                  iconPath: AppAssets.USER_LOCATION,
                                  text: "Address",
                                  onTap: () {},
                                ),
                                _optionCard(
                                  iconColor: AppColors.ORANGE,
                                  iconPath: AppAssets.CLOCK,
                                  text: "Transaction History",
                                  onTap: () {},
                                ),
                                _optionCard(
                                    iconColor: AppColors.BLUE,
                                    iconPath: AppAssets.USERS,
                                    text: "Contract",
                                    onTap: () {},
                                    topBorder: true),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      _optionCard(
                        iconColor: AppColors.LIGHT_GREY,
                        iconPath: AppAssets.SETTING,
                        text: "Settings",
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      _optionCard(
                        iconColor: AppColors.LIGHT_GREY,
                        iconPath: AppAssets.LIFE_RING,
                        text: "Help Center",
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _optionCard({
    required String iconPath,
    required String text,
    required Callback onTap,
    required Color iconColor,
    bool topBorder = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.RADIUS12),
        child: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.WHITE,
              border: topBorder
                  ? Border(
                      top: BorderSide(
                      color: AppColors.BLACK.withOpacity(0.1),
                    ))
                  : null),
          child: Row(children: [
            SvgPicture.asset(
              iconPath,
              height: 22,
              colorFilter: ColorFilter.mode(
                iconColor,
                BlendMode.srcIn,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: AppColors.BLACK,
                    fontSize: AppDimensions.FONT_SIZE16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            _arrowIcon()
          ]),
        ),
      ),
    );
  }

  Container _userProfileCardSection() {
    return Container(
      height: 100,
      width: 100.w,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.WHITE,
        borderRadius: BorderRadius.circular(AppDimensions.RADIUS12),
      ),
      child: Row(
        children: [
          const UserProfileImageCard(
            imagePath:
                "https://static.vecteezy.com/system/resources/previews/009/397/892/original/woman-face-expression-clipart-design-illustration-free-png.png",
          ),
          const Expanded(
              child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Jane Doe",
                    style: TextStyle(
                      color: AppColors.BLACK,
                      fontSize: AppDimensions.FONT_SIZE16,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 4,
                ),
                Text("378-854-324",
                    style: TextStyle(
                      color: AppColors.LIGHT_BLACK,
                      fontSize: AppDimensions.FONT_SIZE14,
                    ))
              ],
            ),
          )),
          //Warning
          // We can pass data if verified or not  but now it's just dummy data
          Container(
            height: 30,
            padding: const EdgeInsets.all(2),
            child: const TextCard(
                textColor: AppColors.GREEN,
                cardColor: AppColors.LIGHT_GREEN,
                text: "Verified"),
          ),
          _arrowIcon()
        ],
      ),
    );
  }

  Padding _arrowIcon() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Icon(
        Icons.arrow_forward_ios_rounded,
        color: AppColors.LIGHT_GREY,
      ),
    );
  }

  Row _customAppBar() {
    return Row(
      children: [
        const Expanded(
          child: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              "Profile",
              style: TextStyle(
                color: AppColors.BLACK,
                fontSize: AppDimensions.FONT_SIZE16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
            child: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppAssets.BELL,
                colorFilter: const ColorFilter.mode(
                  AppColors.LIGHT_GREY,
                  BlendMode.srcIn,
                ),
              )),
        ))
      ],
    );
  }
}
