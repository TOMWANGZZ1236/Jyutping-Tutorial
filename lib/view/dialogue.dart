import 'package:flutter/material.dart';

class FillInTheBlanks extends StatefulWidget {
  final String text1;
  final String text2;
  final List<String> draggables;
  final String text3;
  final String text4;
  final List<String> correctAnswer;
  final String text5;
  final String imageAddress;
  final String route;

  const FillInTheBlanks(
      {super.key,
      required this.text1,
      required this.text2,
      required this.draggables,
      required this.text3,
      required this.text4,
      required this.correctAnswer,
      required this.text5,
      required this.imageAddress,
      required this.route});
  @override
  _FillInTheBlanksState createState() => _FillInTheBlanksState();
}

class _FillInTheBlanksState extends State<FillInTheBlanks> {
  String? firstBlank;
  String? secondBlank;
  bool exerciseCompleted = false;

  void checkCompletion() {
    if (firstBlank == widget.correctAnswer[0] &&
        secondBlank == widget.correctAnswer[1]) {
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
          const Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              "根據下面的對話，將對應的聲母拖至相應方格",
              style: TextStyle(fontSize: 20),
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Character image
              Container(
                margin: EdgeInsets.all(10),
                child: Icon(
                  Icons
                      .account_circle, // Replace with Image.asset if you have a custom image
                  size: 50,
                  color: Colors.blue,
                ),
              ),

              // Dialogue in a speech bubble
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      widget.text1,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),

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

          // Fill in the blanks sentence
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Character image

              // Dialogue in a speech bubble
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: RichText(
                      text: TextSpan(
                        // style: TextStyle(color: Colors.black, fontSize: 24),
                        children: [
                          WidgetSpan(
                            child: Column(
                              children: [
                                Text(
                                  widget.text2,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ],
                            ),
                          ),
                          WidgetSpan(
                            child: Column(
                              children: [
                                Text(
                                  widget.text3,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 24),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Icon(
                  Icons
                      .account_circle, // Replace with Image.asset if you have a custom image
                  size: 50,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 24),
                        children: [
                          WidgetSpan(
                            child: _buildDragTarget(
                                firstBlank, widget.correctAnswer[0]),
                          ),
                          TextSpan(text: widget.text4),
                          WidgetSpan(
                            child: _buildDragTarget(
                                secondBlank, widget.correctAnswer[1]),
                          ),
                          TextSpan(text: widget.text5),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Draggable letters
              Wrap(
                spacing: 8.0,
                children: widget.draggables
                    .map((letter) => Draggable<String>(
                          data: letter,
                          child: _buildDraggableLetter(letter),
                          feedback: _buildDraggableLetter(letter),
                          childWhenDragging:
                              _buildDraggableLetter(letter, dragging: true),
                        ))
                    .toList(),
              ),
              SizedBox(height: 20),
              if (exerciseCompleted)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, widget.route);
                    },
                    child: Text('🎉繼續🎉', style: TextStyle(fontSize: 30)),
                  ),
                ),
            ],
          ),

          // Next Exercise Button
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
            if (correctAnswer == widget.correctAnswer[0]) {
              firstBlank = receivedItem.data;
            } else if (correctAnswer == widget.correctAnswer[1]) {
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
