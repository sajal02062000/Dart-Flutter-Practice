import 'package:flutter/material.dart';

import '../Constants/custom_colors.dart';

class CustomGradientBackground extends StatelessWidget {
  const CustomGradientBackground({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [CustomColors.primaryColor, CustomColors.secondaryColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
