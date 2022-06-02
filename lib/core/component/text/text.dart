import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Color textColor;
  final TextAlign? textAlign;
  final FontWeight fontWeight;
  final double? fontSize;

  const CustomText({
    Key? key,
    this.text,
    required this.textColor,
    this.textAlign,
    required this.fontWeight,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kToolbarHeight / 4),
      child: Text(
        text == null ? 'Information Not Available' : text!,
        textAlign: textAlign,
        style: TextStyle(
          color: textColor,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
