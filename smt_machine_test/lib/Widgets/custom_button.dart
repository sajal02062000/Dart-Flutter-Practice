import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.child,
    this.buttonText = "",
    this.borderRadius = 15,
    this.fontSize = 16,
    this.buttonColor = const Color(0XFF0D80F2),
    this.borderColor = const Color(0XFF0D80F2),
    this.textColor = Colors.white,
    this.needBorder = false,
    required this.onTap,
    this.fontWeight = FontWeight.w600,
    this.isLoading = false,
  });
  final Widget? child;
  final String buttonText;
  final double borderRadius, fontSize;
  final Color buttonColor;
  final Color textColor;
  final Color borderColor;
  final VoidCallback onTap;
  final bool needBorder;
  final FontWeight fontWeight;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: isLoading ? null : onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: needBorder ? BorderSide(color: borderColor) : BorderSide.none,
      ),
      elevation: 0,
      focusElevation: 1,
      hoverElevation: 1,
      color: buttonColor,
      child: Center(
        child: isLoading
            ? Padding(
                padding: const EdgeInsets.all(16),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CircularProgressIndicator(color: textColor),
                ),
              )
            : child ??
                  Text(
                    buttonText,
                    style: TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
                  ),
      ),
    );
  }
}
