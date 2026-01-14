import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/Constants/custom_colors.dart';

import '../Constants/user_chats.dart';
import '../Widgets/custom_chat_card.dart';
import '../Widgets/styled_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.darkGreen,
        title: StyledText(
          text: "Whatsapp UI Clone",
          fontSize: 18,
          fontColor: CustomColors.white,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: userChats
            .map(
              (e) => CustomChatCard(
                name: e.name,
                image: e.image,
                lastMessage: e.lastMessage,
              ),
            )
            .toList(),
      ),
    );
  }
}
