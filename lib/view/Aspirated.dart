import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class TextWithSoundIcon extends StatefulWidget {
  final String text;
  final String soundPath;
  final String? alphaText;
  final double width;
  final double height;
  final Function(bool) onActivated;

  const TextWithSoundIcon({
    Key? key,
    required this.text,
    required this.soundPath,
    required this.alphaText,
    required this.onActivated,
    required this.width,
    required this.height,
  }) : super(key: key);

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
        Text(
          widget.alphaText!,
          style: TextStyle(fontSize: 24.0),
        ),
        Text(
          widget.text,
          style: TextStyle(fontSize: 24.0),
        ),
        SizedBox(height: 10.0),
        IconButton(
          icon: Icon(Icons.volume_up),
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
              color: isSoundPlayed ? Colors.green : Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: isSoundPlayed
                ? const Icon(Icons.check, color: Colors.white)
                : null, // Show icon only when animation is active
          ),
        ),
      ],
    );
  }
}

class AspiratedInitials extends StatefulWidget {
  const AspiratedInitials({super.key});

  @override
  State<AspiratedInitials> createState() => _AspiratedInitialsState();
}

class _AspiratedInitialsState extends State<AspiratedInitials> {
  List<bool> checkboxStates = [
    false,
    false,
    false,
    false,
    false,
    false
  ]; // Track checkbox states
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('送氣音💨💨'),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                  'p, t, k 有很強的噴氣；b, d, g 不噴氣，也不震動聲帶。\n'
                  '請跟住下面嘅讀音聽吓送氣嘅感覺。\n',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('冇送氣🤐：',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextWithSoundIcon(
                  text: "百",
                  soundPath: 'sound/baat3.mp3',
                  alphaText: 'b',
                  onActivated: (activated) {
                    setState(() {
                      checkboxStates[0] = activated;
                    });
                  },
                  width: 30,
                  height: 30,
                ),
                TextWithSoundIcon(
                  text: "島",
                  soundPath: "sound/dou2.mp3",
                  alphaText: 'd',
                  onActivated: (activated) {
                    setState(() {
                      checkboxStates[1] = activated;
                    });
                  },
                  width: 30,
                  height: 30,
                ),
                TextWithSoundIcon(
                  text: "家",
                  soundPath: "sound/gaa1.mp3",
                  alphaText: 'g',
                  onActivated: (activated) {
                    setState(() {
                      checkboxStates[2] = activated;
                    });
                  },
                  width: 30,
                  height: 30,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('有送氣💨：',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextWithSoundIcon(
                  text: "拍",
                  soundPath: "sound/paak3.mp3",
                  alphaText: 'p',
                  onActivated: (activated) {
                    setState(() {
                      checkboxStates[3] = activated;
                    });
                  },
                  width: 30,
                  height: 30,
                ),
                TextWithSoundIcon(
                  text: "土",
                  soundPath: "sound/tou2.mp3",
                  alphaText: 't',
                  onActivated: (activated) {
                    setState(() {
                      checkboxStates[4] = activated;
                    });
                  },
                  width: 30,
                  height: 30,
                ),
                TextWithSoundIcon(
                  text: "卡",
                  soundPath: "sound/kaa1.mp3",
                  alphaText: 'k',
                  onActivated: (activated) {
                    setState(() {
                      checkboxStates[5] = activated;
                    });
                  },
                  width: 30,
                  height: 30,
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            if (checkboxStates.every(
                (state) => state)) // Check if all checkboxes are activated
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/module1-2');
                },
                child: const Text(
                  '繼續',
                  style: TextStyle(fontSize: 20),
                ),
              ),
          ],
        ));
  }
}
