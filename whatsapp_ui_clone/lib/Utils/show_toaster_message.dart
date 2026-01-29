import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/Widgets/styled_text.dart';

void showCustomToaster({
  required BuildContext context,
  required String message,
}) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: StyledText(text: message)));
}
