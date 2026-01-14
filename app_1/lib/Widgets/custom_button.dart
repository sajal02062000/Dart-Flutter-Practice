import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.buttonColor,
    this.textColor,
  });
  final VoidCallback onTap;
  final String text;
  final Color? buttonColor, textColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: buttonColor,
      child: Text(text, style: TextStyle(color: textColor)),
    );
  }
}
