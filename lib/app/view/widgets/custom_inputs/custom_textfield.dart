import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:netspotpay/app/util/constants/app_colors.dart';
import 'package:netspotpay/app/view/widgets/custom_inputs/input_skin.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.validator,
    this.hintText,
    this.textEditingController,
    this.isPasswordField = false,
    required this.iconPath,
    required this.labelText,
    this.iconColor,
    this.onTap,
    this.readOnly = false,
    this.checkColor,
    this.keyboardType,
  });
  final bool readOnly;
  final String? Function(String?)? validator;
  final String? hintText;
  final String labelText;
  final TextEditingController? textEditingController;
  final bool isPasswordField;
  final String iconPath;
  final Color? iconColor;
  final Color? checkColor;
  final Callback? onTap;
  final TextInputType? keyboardType;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isValid = false;
  void _checkInput(String value) {
    setState(() {
      // check the validation value. if value is not null then it's not valid yet.
      _isValid = widget.validator!.call(value) == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InputSkin(
      label: widget.labelText,
      child: TextFormField(
        keyboardType: widget.keyboardType,
        controller: widget.textEditingController,
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        obscureText: widget.isPasswordField,
        validator: widget.validator,

        // if there is no validation, then no need to check the input

        onChanged: widget.validator == null ? null : _checkInput,
        decoration: InputDecoration(
          hintText: widget.hintText ?? widget.labelText,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
            ),
            child: SvgPicture.asset(
              widget.iconPath,
              colorFilter: ColorFilter.mode(
                widget.iconColor ?? AppColors.FIELD_ICON_COLOR,
                BlendMode.srcIn,
              ),
            ),
          ),
          suffixIcon: _isValid
              ? Icon(Icons.check_circle_outline,
                  color: widget.checkColor ?? AppColors.BLUE)
              : null,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
