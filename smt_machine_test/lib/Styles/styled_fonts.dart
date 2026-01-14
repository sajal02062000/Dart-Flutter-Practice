import 'package:flutter/material.dart';
import '../../Constants/globals.dart';

class StyledHeadingText extends StatelessWidget {
  const StyledHeadingText({
    super.key,
    required this.text,
    this.fontSize = 22,
    this.fontWeight = FontWeight.w800,
    this.textAlign = TextAlign.start,
    this.color,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.decoration,
    this.fontStyle,
    this.decorationStyle,
    this.decorationColor,
    this.decorationThickness,
  });
  final String text;
  final double fontSize;
  final int? maxLines;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final Color? color;
  final TextOverflow overflow;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;
  final TextDecorationStyle? decorationStyle;
  final Color? decorationColor;
  final double? decorationThickness;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: fontStyles.headingTextStyle.copyWith(
        color: color ?? (Color(0XFF000000)),
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
        fontStyle: fontStyle,
        decorationThickness: decorationThickness,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      textScaler: TextScaler.noScaling,
    );
  }
}

class StyledRegularText extends StatelessWidget {
  const StyledRegularText({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.color,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.decoration,
    this.fontStyle,
  });
  final String text;
  final double fontSize;
  final int? maxLines;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final Color? color;
  final TextOverflow overflow;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: fontStyles.regularTextStyle.copyWith(
        color: color ?? (Color(0XFF000000)),
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
        fontStyle: fontStyle,
        decorationColor: color,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      textScaler: TextScaler.noScaling,
    );
  }
}
