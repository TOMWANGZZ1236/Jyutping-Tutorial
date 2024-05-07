import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Wordwithsound extends StatefulWidget {
  final String text;
  final String soundPath;
  const Wordwithsound({
    super.key,
    required this.text,
    required this.soundPath,
  });

  @override
  State<Wordwithsound> createState() => _WordwithsoundState();
}

class _WordwithsoundState extends State<Wordwithsound> {
  final player = AudioPlayer();
  void playSound() async {
    player.play(AssetSource(widget.soundPath));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(widget.text, style: TextStyle(fontSize: 18)),
        SizedBox(
          // Reserve space for the tick animation
          width: 20,
          height: 20,
          child: matched[word]!
              ? Icon(Icons.check, color: Colors.green)
              : SizedBox(width: 20),
        ),
      ],
    );
  }
}
