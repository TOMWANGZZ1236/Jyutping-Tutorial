import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:testapp/constants/theme_constants.dart';
import 'package:testapp/interface/interface_p2.dart';
import 'package:testapp/interface/interface_p3.dart' as p3;
import 'package:testapp/interface/lesson_interface.dart';
import 'package:testapp/views/general_views.dart/dialogue_view.dart';
import 'package:testapp/widgets.dart/back_main.dart';

class MatchingGame extends StatefulWidget {
  final LessonView2 view;
  final String introTitle;
  final String route;
  final Map<String, dynamic> matched;
  final List<dynamic> alphaText;

  const MatchingGame({
    super.key,
    required this.route,
    required this.view,
    required this.introTitle,
    required this.matched,
    required this.alphaText,
  });

  @override
  _MatchingGameState createState() => _MatchingGameState();
}

class _MatchingGameState extends State<MatchingGame> {
  late final List<LiteralSection> literalSections;
  late final List<SoundSection> soundSections;
  final player = AudioPlayer();

  String? selectedWord;
  String? checkingWord;
  String? selectedLetter;
  bool allMatched = false;

  @override
  initState() {
    literalSections = widget.view.literalSections;
    soundSections = widget.view.soundSections;
    super.initState();
  }

  void checkMatch() {
    if (checkingWord != null && selectedLetter != null) {
      if (checkingWord == selectedLetter) {
        setState(() {
          widget.matched[selectedWord!] = true;
          checkingWord = null;
          selectedLetter = null;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('\t\t\t試多次喇！'),
            backgroundColor: redColor,
          ),
        );
      }
    }

    if (widget.matched.values.every((m) => m)) {
      setState(() {
        allMatched = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.introTitle,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold)),
        actions: <Widget>[
          CustomExitIconButton(
            context: context,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Text(literalSections[1].description,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: soundSections[0]
                    .soundElements
                    .asMap()
                    .entries
                    .map((soundElement) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedWord = soundElement.value.text;
                            checkingWord = soundElement.value.alphaText;
                            selectedLetter = null;
                            for (String soundPathItem
                                in soundElement.value.soundPath) {
                              player.play(AssetSource(soundPathItem));
                            }

                            checkMatch();
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: selectedWord == soundElement.value.text
                                ? lightBlueColor
                                : lightGreyColor,
                            border: Border.all(color: blackColor),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(soundElement.value.text,
                                  style: Theme.of(context).textTheme.bodyLarge),
                              SizedBox(
                                // Reserve space for the tick animation
                                width: 20,
                                height: 20,
                                child: widget.matched[soundElement.value.text]
                                    ? const Icon(Icons.check, color: greenColor)
                                    : const SizedBox(width: 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                }).toList(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.view.alphaText.map((alphaText) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedLetter = alphaText;
                            checkMatch();
                          });
                        },
                        child: Container(
                          width: 40,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: selectedLetter == alphaText
                                ? lightBlueColor
                                : lightGreyColor,
                            border: Border.all(color: blackColor),
                          ),
                          child: Text(alphaText,
                              style: Theme.of(context).textTheme.bodyLarge),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
          if (allMatched)
            ElevatedButton(
              onPressed: () async {
                Lesson lesson = await loadLesson('assets/jsons/lesson1.json');
                p3.LessonView3 lesson1View3 = lesson.views[2];
                String lesson1Title = lesson1View3.viewTitle;
                String route = lesson1View3.route;
                List<dynamic> draggables = lesson1View3.draggables;
                List<dynamic> correctAnswer = lesson1View3.correctAnswer;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FillInTheBlanks(
                      view: lesson1View3,
                      introTitle: lesson1Title,
                      route: route,
                      draggables: draggables,
                      correctAnswer: correctAnswer,
                    ),
                  ),
                );
              },
              child: const Text(
                '繼續',
              ),
            ),
        ],
      ),
    );
  }
}
