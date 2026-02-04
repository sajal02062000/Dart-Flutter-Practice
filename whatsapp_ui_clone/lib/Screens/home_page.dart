import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp_ui_clone/Constants/custom_colors.dart';
import 'package:whatsapp_ui_clone/Models/user_model.dart';

import '../Constants/user_chats.dart';
import '../Utils/show_toaster_message.dart';
import '../Widgets/custom_chat_card.dart';
import '../Widgets/spacing.dart';
import '../Widgets/styled_text.dart';
import 'image_picker_screen.dart';
import 'player_screen.dart';
import 'video_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // bool _isStatusOpen = false;
  Timer? _timer;
  final Duration _duration = Duration(seconds: 1);
  String currentTimer = "";
  List<UserModel> allData = [];
  IconData icon = Icons.keyboard_arrow_down_rounded;

  void implementSearch({required String search}) {
    allData.clear();
    if (search.isNotEmpty) {
      setState(() {
        allData.addAll(
          userChats.where(
            (element) =>
                element.name.toLowerCase().contains(search.toLowerCase()),
          ),
        );
      });
    } else {
      setState(() {
        allData.addAll(userChats);
      });
    }
  }

  void updateStatus(bool value) {
    // setState(() {
    //   _isStatusOpen = value;
    // });
    // _timer = Timer(_duration, () {
    //   // Navigator.pop(context);
    //   showCustomToaster(context: context, message: "Timer complete ho gya hai");
    // });
    _timer = Timer.periodic(_duration, (timer) {
      setState(() {
        currentTimer = "${timer.tick}";
      });
      if (timer.tick == 10) {
        showCustomToaster(context: context, message: "Timer completed");
        _timer?.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    allData.addAll(userChats);
  }

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
        actions: [
          PopupMenuButton(
            position: PopupMenuPosition.under,
            icon: Icon(icon),
            onOpened: () {
              setState(() {
                icon = Icons.keyboard_arrow_up_rounded;
              });
            },
            onCanceled: () {
              setState(() {
                icon = Icons.keyboard_arrow_down_rounded;
              });
            },
            onSelected: (value) {
              setState(() {
                icon = Icons.keyboard_arrow_down_rounded;
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                child: StyledText(text: "Profile"),
                onTap: () {},
              ),
              PopupMenuItem(
                child: StyledText(text: "Data"),
                onTap: () {},
              ),
              PopupMenuItem(
                child: StyledText(text: "Settings"),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2),
              color: CustomColors.black.withValues(alpha: 0.2),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: CustomColors.white,
        ),
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [Icons.home, Icons.chat, Icons.phone]
              .map(
                (e) => Expanded(
                  child: InkWell(onTap: () {}, child: Icon(e)),
                ),
              )
              .toList(),
        ),
      ),
      body: Column(
        children: [
          Spacing(),
          SizedBox(
            height: 90,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: userChats.length,
              separatorBuilder: (context, index) =>
                  Spacing(spacing: 4, type: Type.horizontal),
              itemBuilder: (context, index) {
                UserModel e = userChats[index];
                return ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(100),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () => {
                        updateStatus(true),
                        // showCustomBottomSheet(
                        //   context: context,
                        //   title: "${e.name} ${_timer?.tick}",
                        //   child: Center(
                        //     child: Visibility(
                        //       replacement: StyledText(
                        //         text: "No Image to display",
                        //         fontColor: CustomColors.white,
                        //       ),
                        //       visible: e.image != null,
                        //       child: Image.network(e.image ?? ""),
                        //     ),
                        //   ),
                        // ),
                      },
                      child: Visibility(
                        replacement: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: CustomColors.darkGreen2,
                              width: 2,
                            ),
                          ),
                          child: StyledText(text: "No Image"),
                        ),
                        visible: e.image != null,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: CustomColors.darkGreen2,
                              width: 4,
                            ),
                          ),
                          child: Image.network(
                            e.image ?? "",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Spacing(),
          StyledText(text: "Timer = $currentTimer"),
          StyledText(
            text: "Media Query = ${MediaQuery.of(context).size.width}",
          ),
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlayerScreen()),
            ),
            child: StyledText(text: "Go to player"),
          ),
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VideoApp()),
            ),
            child: StyledText(text: "Go to Video"),
          ),
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ImagePickerScreen()),
            ),
            child: StyledText(text: "Pick Image"),
          ),
          Spacing(),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: CustomColors.darkGreen),
              ),
              hint: StyledText(text: "Search users...."),
            ),
            onChanged: (value) => implementSearch(search: value),
          ),
          Spacing(),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: allData
                  .map(
                    (e) => CustomChatCard(
                      name: e.name,
                      image: e.image,
                      lastMessage: e.lastMessage,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
