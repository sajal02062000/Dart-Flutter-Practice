import 'package:flutter/material.dart';
import 'package:smt_machine_test/Constants/custom_colors.dart';

import '../Styles/styled_fonts.dart';

class CustomLabelText extends StatelessWidget {
  const CustomLabelText({
    super.key,
    required this.labelText,
    this.isRequired = false,
  });

  final String labelText;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StyledRegularText(
          text: labelText,
          fontSize: 16,
          color: CustomColors.primaryColor,
          fontWeight: FontWeight.normal,
        ),
        if (isRequired)
          const StyledHeadingText(text: " *", fontSize: 16, color: Colors.red),
      ],
    );
  }
}
