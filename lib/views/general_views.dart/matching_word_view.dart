import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:testapp/constants/theme_constants.dart';
import 'package:testapp/widgets.dart/back_main.dart';

class MatchingGame extends StatefulWidget {
  final Map<String, String> wordSound;
  final Map<String, String> words;
  final Map<String, bool> matched;
  final List<String> letters;
  final String route;

  const MatchingGame({
    super.key,
    required this.wordSound,
    required this.words,
    required this.matched,
    required this.letters,
    required this.route,
  });

  @override
  _MatchingGameState createState() => _MatchingGameState();
}

class _MatchingGameState extends State<MatchingGame> {
  final player = AudioPlayer();

  String? selectedWord;
  String? selectedLetter;
  bool allMatched = false;

  void checkMatch() {
    if (selectedWord != null && selectedLetter != null) {
      if (widget.words[selectedWord] == selectedLetter) {
        setState(() {
          widget.matched[selectedWord!] = true;
          selectedWord = null;
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
        title: const Text('練習'),
        actions: <Widget>[
          CustomExitIconButton(
            context: context,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Text('請將下面的單字與相應的聲母配對',
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
                children: widget.words.keys.map((word) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedWord = word;
                            selectedLetter = null;
                            player.play(AssetSource((widget.wordSound[word])!));
                            checkMatch();
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: selectedWord == word
                                ? lightBlueColor
                                : lightGreyColor,
                            border: Border.all(color: blackColor),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(word,
                                  style: Theme.of(context).textTheme.bodyLarge),
                              SizedBox(
                                // Reserve space for the tick animation
                                width: 20,
                                height: 20,
                                child: widget.matched[word]!
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
                children: widget.letters.map((letter) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedLetter = letter;
                            checkMatch();
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: selectedLetter == letter
                                ? lightBlueColor
                                : lightGreyColor,
                            border: Border.all(color: blackColor),
                          ),
                          child: Text(letter,
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
          if (allMatched) SizedBox(height: 20),
          if (allMatched)
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, widget.route);
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
