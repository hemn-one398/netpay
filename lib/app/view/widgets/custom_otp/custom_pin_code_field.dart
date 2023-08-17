import 'package:flutter/material.dart';
import 'package:netspotpay/app/view/widgets/custom_otp/pin_field.dart';

class CustomPinCodeField extends StatefulWidget {
  const CustomPinCodeField({super.key, required this.textEditingController});
  final TextEditingController textEditingController;
  @override
  State<CustomPinCodeField> createState() => _CustomPinCodeFieldState();
}

class _CustomPinCodeFieldState extends State<CustomPinCodeField> {
  void _setValueToController(String value) {
    widget.textEditingController.text += value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PinField(
          getValue: _setValueToController,
        ),
        PinField(
          getValue: _setValueToController,
        ),
        PinField(
          getValue: _setValueToController,
        ),
        PinField(
          getValue: _setValueToController,
        ),
      ],
    );
  }
}
