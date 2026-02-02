import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/Widgets/styled_text.dart';
import 'package:just_audio/just_audio.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  static const String audio = "assets/audios/sample.mp3";
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledText(text: "Player Screen")),
      body: Center(
        child: IconButton(
          onPressed: () async {
            await player.setAsset(audio);
            await player.play();
          },
          icon: Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
