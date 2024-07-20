import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:testapp/constants/theme_constants.dart';

class TextWithSoundIcon extends StatefulWidget {
  final String text;
  final String soundPath;
  final String? alphaText;
  final double width;
  final double height;
  final Function(bool) onActivated;
  final bool fontWeight;

  const TextWithSoundIcon({
    super.key,
    required this.text,
    required this.soundPath,
    required this.alphaText,
    required this.onActivated,
    required this.width,
    required this.height,
    required this.fontWeight,
  });

  @override
  _TextWithSoundIconState createState() => _TextWithSoundIconState();
}

class _TextWithSoundIconState extends State<TextWithSoundIcon> {
  bool isSoundPlayed = false;

  final player = AudioPlayer();
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void playSound() async {
    player.play(AssetSource(widget.soundPath));
    setState(() {
      isSoundPlayed = true;
      widget.onActivated(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.alphaText != null
            ? Text(
                widget.alphaText!,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            : const SizedBox(),
        Text(
          widget.text,
          style: widget.fontWeight == true
              ? Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold)
              : Theme.of(context).textTheme.bodyLarge!,
        ),
        const SizedBox(height: 5.0),
        IconButton(
          icon: const Icon(Icons.volume_up),
          onPressed: playSound,
        ),
        SizedBox(
          // Reserve space for the tick animation
          width: widget.width,
          height: widget.height,
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: isSoundPlayed ? greenColor : whiteColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: isSoundPlayed
                ? const Icon(Icons.check, color: whiteColor)
                : null, // Show icon only when animation is active
          ),
        ),
      ],
    );
  }
}
