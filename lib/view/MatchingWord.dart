import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

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
            backgroundColor: Colors.red,
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
      appBar: AppBar(title: Text('練習')),
      body: Column(
        children: <Widget>[
          SizedBox(height: 50),
          const Text('請將下面嘅單字同相應嘅聲母配對',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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
                                ? Colors.blue[100]
                                : Colors.grey[200],
                            border: Border.all(color: Colors.black),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(word, style: TextStyle(fontSize: 18)),
                              SizedBox(
                                // Reserve space for the tick animation
                                width: 20,
                                height: 20,
                                child: widget.matched[word]!
                                    ? Icon(Icons.check, color: Colors.green)
                                    : SizedBox(width: 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
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
                                ? Colors.blue[100]
                                : Colors.grey[200],
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text(letter, style: TextStyle(fontSize: 24)),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
          if (allMatched) SizedBox(height: 50),
          if (allMatched)
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, widget.route);
              },
              child: const Text('🎉繼續🎉', style: TextStyle(fontSize: 30)),
            ),
        ],
      ),
    );
  }
}
