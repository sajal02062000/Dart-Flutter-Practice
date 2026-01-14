import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.fontWeight,
    this.maxLines,
    this.textStyle,
    this.fontColor,
  });
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextStyle? textStyle;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          textStyle ??
          TextStyle(
            fontFamily: "Gravitas_One",
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: fontColor,
          ),
      maxLines: maxLines,
    );
  }
}
