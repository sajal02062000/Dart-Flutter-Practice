import 'package:flutter/material.dart';

import '../Constants/custom_colors.dart';
import '../Widgets/styled_text.dart';

void showCustomBottomSheet({
  required BuildContext context,
  Widget? child,
  String? title,
  Color background = CustomColors.black,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => Container(
      decoration: BoxDecoration(color: background),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_rounded, color: CustomColors.white),
              ),
              Expanded(
                child: Center(
                  child: StyledText(
                    text: title ?? "",
                    fontColor: CustomColors.white,
                  ),
                ),
              ),
            ],
          ),
          Expanded(child: child ?? SizedBox()),
        ],
      ),
    ),
  );
}
