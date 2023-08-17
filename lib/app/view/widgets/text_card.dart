import 'package:flutter/material.dart';
import 'package:netspotpay/app/util/constants/app_dimensions.dart';

class TextCard extends StatelessWidget {
  const TextCard({
    super.key,
    required this.textColor,
    required this.cardColor,
    required this.text,  this.fontWeight,

  });
  final Color textColor, cardColor;
  final String text;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(
        6,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.RADIUS8),
          color: cardColor),
      child: Text(
        text,
        style: TextStyle(fontSize: AppDimensions.FONT_SIZE12,
        fontWeight: fontWeight,
        
         color: textColor),
      ),
    );
  }
}
