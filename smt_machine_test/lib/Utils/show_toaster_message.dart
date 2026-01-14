import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smt_machine_test/Constants/custom_colors.dart';
import '../Styles/styled_fonts.dart';

enum ToasterMessageType { success, error, warning, info }

void showToasterMessage({
  required BuildContext context,
  required String message,
  required ToasterMessageType type,
}) {
  // Get color based on type
  final Color typeColor = type == ToasterMessageType.success
      ? CustomColors.primaryColor
      : type == ToasterMessageType.error
      ? Colors.red
      : type == ToasterMessageType.warning
      ? CustomColors.secondaryColor
      : CustomColors.primaryColor;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.horizontal,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.zero,
      content: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  typeColor.withValues(alpha: 0.25),
                  typeColor.withValues(alpha: 0.15),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: typeColor.withValues(alpha: 0.4),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: typeColor.withValues(alpha: 0.3),
                  blurRadius: 20,
                  spreadRadius: 2,
                  offset: const Offset(0, 8),
                ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon based on type
                Icon(
                  type == ToasterMessageType.success
                      ? Icons.check_circle_outline
                      : type == ToasterMessageType.error
                      ? Icons.error_outline
                      : type == ToasterMessageType.warning
                      ? Icons.warning_amber_outlined
                      : Icons.info_outline,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: 12),
                // Message text
                Expanded(
                  child: StyledRegularText(
                    text: message,
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
