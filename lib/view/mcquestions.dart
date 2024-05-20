import 'package:flutter/material.dart';

class MultipleChoiceTest extends StatefulWidget {
  final String word;
  final List<String> options;
  final int correctIndex;
  final String imageAddress;
  final String route;

  MultipleChoiceTest({
    Key? key,
    required this.word,
    required this.options,
    required this.correctIndex,
    required this.imageAddress,
    required this.route,
  }) : super(key: key);

  @override
  _MultipleChoiceTestState createState() => _MultipleChoiceTestState();
}

class _MultipleChoiceTestState extends State<MultipleChoiceTest> {
  int? selectedIndex;
  bool? isCorrect;

  void _answerQuestion(int index) {
    setState(() {
      selectedIndex = index;
      isCorrect = (index == widget.correctIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("多項選擇題")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              "根據下面的對話，將選出對應的聲母",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
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
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(widget.word,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ),
          ...widget.options.asMap().entries.map((entry) {
            int idx = entry.key;
            String option = entry.value;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextButton(
                onPressed: () => _answerQuestion(idx),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  backgroundColor: selectedIndex == idx
                      ? (isCorrect! ? Colors.green : Colors.red)
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.blue, width: 2),
                  ),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text(option),
              ),
            );
          }).toList(),
          Opacity(
            opacity: isCorrect ?? false
                ? 1.0
                : 0.0, // Opacity is 0.0 unless the correct answer is selected
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, widget.route);
                  },
                  child: Text('🎉繼續🎉', style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
