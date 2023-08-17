import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';

class PinField extends StatelessWidget {
  const PinField({
    super.key,
    this.getValue,
  });
  final void Function(String)? getValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 62,
      width: 68,
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 14,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.GREY_COLOR,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        onChanged: (value) {
          getValue?.call(value);
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColors.BLACK,
          fontSize: AppDimensions.FONT_SIZE20,
          fontWeight: FontWeight.bold,
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 10),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: AppColors.LIGHT_BLACK,
            width: 2,
          )),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: AppColors.BLUE,
            width: 2,
          )),
        ),
      ),
    );
  }
}
