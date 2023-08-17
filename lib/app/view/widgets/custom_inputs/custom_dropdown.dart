import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';
import 'package:netspotpay/app/view/widgets/custom_inputs/input_skin.dart';

class CustomDropDown<T> extends StatefulWidget {
  const CustomDropDown(
      {super.key,
      required this.labelText,
      required this.iconPath,
      required this.value,
      required this.items,
      this.onChanged,
      required this.hintText,
      this.iconColor});
  final Color? iconColor;
  final String labelText;
  final String hintText;
  final T? value;
  final List<T>? items;
  final void Function(dynamic)? onChanged;
  final String iconPath;
  @override
  CustomDropDownState createState() => CustomDropDownState();
}

class CustomDropDownState<T> extends State<CustomDropDown<T>> {
  @override
  Widget build(BuildContext context) {
    return InputSkin(
      label: widget.labelText,
      child: DropdownButtonFormField<T>(
        isExpanded: true,
        value: widget.value,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: AppColors.BLACK,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(widget.iconPath,
                height: 20,
                colorFilter: ColorFilter.mode(
                  widget.iconColor ?? AppColors.FIELD_ICON_COLOR,
                  BlendMode.srcIn,
                )),
          ),
          border: InputBorder.none,
        ),
        onChanged: widget.onChanged,
        items: widget.items!.map((item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(item.toString()),
          );
        }).toList(),
      ),
    );
  }
}
