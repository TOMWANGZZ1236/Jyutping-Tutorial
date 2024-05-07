import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: FillInTheBlanks()));
}

class FillInTheBlanks extends StatefulWidget {
  @override
  _FillInTheBlanksState createState() => _FillInTheBlanksState();
}

class _FillInTheBlanksState extends State<FillInTheBlanks> {
  String? firstBlank;
  String? secondBlank;
  bool exerciseCompleted = false;

  void checkCompletion() {
    if (firstBlank == 'p' && secondBlank == 'g') {
      setState(() {
        exerciseCompleted = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("小試牛刀")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              "根據下面的對話，將對應的聲母拖至相應方格",
              style: TextStyle(fontSize: 20),
            ),
          ),
          // Dialogue
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "你今日食咗啲乜嘢?",
              style: TextStyle(fontSize: 24),
            ),
          ),
          Flexible(
            // The Flexible widget allows the image to resize within the row.
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/images/apple.webp',
                fit: BoxFit
                    .contain, // This ensures the image scales properly within its bounds.
              ),
            ),
          ),

          // Fill in the blanks sentence
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '我今日食咗蘋果',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 24),
                        children: [
                          // TextSpan(text: "我今日食咗"),
                          WidgetSpan(
                            child: _buildDragTarget(firstBlank, 'p'),
                          ),
                          TextSpan(text: "ing "),

                          WidgetSpan(
                            child: _buildDragTarget(secondBlank, 'g'),
                          ),
                          TextSpan(text: "wo"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Draggable letters
              Wrap(
                spacing: 8.0,
                children: ['b', 'p', 'd', 't', 'g', 'k']
                    .map((letter) => Draggable<String>(
                          data: letter,
                          child: _buildDraggableLetter(letter),
                          feedback: _buildDraggableLetter(letter),
                          childWhenDragging:
                              _buildDraggableLetter(letter, dragging: true),
                        ))
                    .toList(),
              ),
            ],
          ),

          // Next Exercise Button
          if (exerciseCompleted)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to next exercise or reset
                },
                child: Text("繼續"),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDragTarget(String? value, String correctAnswer) {
    return DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        final isAccepting = candidateData.isNotEmpty;
        return Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: isAccepting
                ? Colors.yellow[300]
                : (value == null ? Colors.grey[300] : Colors.green[300]),
            border: Border.all(color: Colors.black),
          ),
          child: Text(value ?? '_',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        );
      },
      onWillAcceptWithDetails: (data) {
        // Only accept the draggable if it matches the correct answer
        return data.data == correctAnswer;
      },
      onAcceptWithDetails: (receivedItem) {
        setState(() {
          // Set the value of the blank to the correct item
          if (receivedItem.data == correctAnswer) {
            if (correctAnswer == 'p') {
              firstBlank = receivedItem.data;
            } else if (correctAnswer == 'g') {
              secondBlank = receivedItem.data;
            }
            checkCompletion();
          }
        });
      },
    );
  }

  Widget _buildDraggableLetter(String letter, {bool dragging = false}) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: dragging ? Colors.transparent : Colors.blue[200],
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(letter,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }
}
