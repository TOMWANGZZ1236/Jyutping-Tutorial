import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:testapp/constants/theme_constants.dart';
import 'package:testapp/widgets.dart/back_main.dart';

class MultipleChoiceTest extends StatefulWidget {
  final String word;
  final List<String> options;
  final int correctIndex;
  final String imageAddress;
  final String route;
  final String soundPath;

  MultipleChoiceTest({
    Key? key,
    required this.word,
    required this.options,
    required this.correctIndex,
    required this.imageAddress,
    required this.soundPath,
    required this.route,
  }) : super(key: key);

  @override
  _MultipleChoiceTestState createState() => _MultipleChoiceTestState();
}

class _MultipleChoiceTestState extends State<MultipleChoiceTest> {
  int? selectedIndex;
  bool? isCorrect;
  late final AudioPlayer player;

  @override
  void initState() {
    player = AudioPlayer();
    super.initState();
  }

  void playSound() async {
    player.play(AssetSource(widget.soundPath));
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
        title: const Text("多項選擇題"),
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
              "根據下面的對話，將選出對應的聲母",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AspectRatio(
                    aspectRatio: 16 / 9, // Aspect ratio of the image
                    child: Image.asset(
                      widget.imageAddress,
                      fit: BoxFit
                          .cover, // This will cover the area of the aspect ratio box
                    ),
                  ),
                ),
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
              padding: const EdgeInsets.only(top: 20),
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
