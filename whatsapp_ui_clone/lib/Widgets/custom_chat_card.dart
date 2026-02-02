import 'package:flutter/material.dart';

import '../Constants/custom_colors.dart';
import 'spacing.dart';
import 'styled_text.dart';

class CustomChatCard extends StatelessWidget {
  const CustomChatCard({
    super.key,
    required this.name,
    this.image,
    this.lastMessage,
  });
  final String name;
  final String? image;
  final String? lastMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: StyledText(text: name),
                content: Center(
                  child: Visibility(
                    replacement: StyledText(text: "No DP"),
                    visible: image != null,
                    child: Image.network(image ?? ""),
                  ),
                ),
              ),
            ),
            child: CircleAvatar(
              backgroundColor: CustomColors.darkGreen2,
              child: Visibility(
                replacement: Icon(Icons.person, color: CustomColors.white),
                visible: image != null,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(1000),
                  child: Image.network(
                    image ?? "",
                    fit: BoxFit.cover,
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
            ),
          ),
          Spacing(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StyledText(text: name),
              Spacing(type: Type.vertical, spacing: 4),
              StyledText(
                text: lastMessage ?? "No messages",
                fontSize: 8,
                fontColor: CustomColors.darkGreen2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
