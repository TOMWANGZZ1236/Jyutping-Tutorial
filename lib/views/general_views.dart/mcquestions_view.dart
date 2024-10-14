import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:testapp/constants/theme_constants.dart';
import 'package:testapp/interface/interface_p4.dart';
import 'package:testapp/widgets.dart/back_main.dart';

class MultipleChoice extends StatefulWidget {
  final LessonView4 view;
  final String viewTitle;
  final List<dynamic> options;
  final int correctIndex;
  final String route;
  final List soundPath;

  MultipleChoice({
    Key? key,
    required this.options,
    required this.correctIndex,
    required this.route,
    required this.view,
    required this.viewTitle,
    required this.soundPath,
  }) : super(key: key);

  @override
  _MultipleChoiceState createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  late final List<LiteralSection> literalSections;
  late final List<SoundSection> soundSections;
  int? selectedIndex;
  bool? isCorrect;
  late final AudioPlayer player;

  @override
  void initState() {
    player = AudioPlayer();
    literalSections = widget.view.literalSections;
    soundSections = widget.view.soundSections;
    super.initState();
  }

  void playSound() async {
    for (String soundPathItem in widget.soundPath) {
      player.play(AssetSource(soundPathItem));
      await player.onPlayerComplete.first;
    }
  }

  void _answerQuestion(int index) {
    setState(() {
      selectedIndex = index;
      isCorrect = (index == widget.correctIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.viewTitle),
        actions: <Widget>[
          CustomExitIconButton(
            context: context,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14),
            child: Text(
              literalSections[0].description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          // Row(
          //   children: [
          //     Flexible(
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: AspectRatio(
          //           aspectRatio: 16 / 9, // Aspect ratio of the image
          //           child: Image.asset(
          //             widget.imageAddress,
          //             fit: BoxFit
          //                 .cover, // This will cover the area of the aspect ratio box
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14),
                child: Text(literalSections[1].description,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 50, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          IconButton(
            onPressed: playSound,
            icon: const Icon(Icons.volume_up),
          ),
          ...widget.options.asMap().entries.map((entry) {
            int idx = entry.key;
            String option = entry.value;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: TextButton(
                onPressed: () => _answerQuestion(idx),
                style: TextButton.styleFrom(
                  foregroundColor: blackColor,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  backgroundColor: selectedIndex == idx
                      ? (isCorrect! ? greenColor : redColor)
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: blueColorMC, width: 2),
                  ),
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                child: Text(option),
              ),
            );
          }),
          Opacity(
            opacity: isCorrect ?? false
                ? 1.0
                : 0.0, // Opacity is 0.0 unless the correct answer is selected
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, widget.route);
                  },
                  child: const Text('繼續'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
