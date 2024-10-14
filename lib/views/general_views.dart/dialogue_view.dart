import 'package:flutter/material.dart';
import 'package:testapp/constants/theme_constants.dart';
import 'package:testapp/interface/interface_p3.dart';
import 'package:testapp/interface/interface_p4.dart' hide LiteralSection;
import 'package:testapp/interface/lesson_interface.dart';
import 'package:testapp/utilities_functions.dart/highlight_text.dart';
import 'package:testapp/views/general_views.dart/mcquestions_view.dart';
import 'package:testapp/widgets.dart/back_main.dart';

class FillInTheBlanks extends StatefulWidget {
  final LessonView3 view;
  final String introTitle;
  final String route;
  final List<dynamic> draggables;
  final List<dynamic> correctAnswer;
  const FillInTheBlanks(
      {super.key,
      required this.draggables,
      required this.route,
      required this.view,
      required this.introTitle,
      required this.correctAnswer});
  @override
  _FillInTheBlanksState createState() => _FillInTheBlanksState();
}

class _FillInTheBlanksState extends State<FillInTheBlanks> {
  late final List<LiteralSection> literalSections;
  String? firstBlank;
  String? secondBlank;
  bool exerciseCompleted = false;

  @override
  initState() {
    literalSections = widget.view.literalSections;
    super.initState();
  }

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              literalSections[1].description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Character image
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Icon(
                    Icons
                        .account_circle, // Replace with Image.asset if you have a custom image
                    size: 40,
                    color: greenColor,
                  ),
                ),

                // Dialogue in a speech bubble
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 13),
                      decoration: BoxDecoration(
                        color: greenColorDialogue,
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
                        literalSections[2].description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Flexible(
          //   child: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: AspectRatio(
          //       aspectRatio: 16 / 9, // Aspect ratio of the image
          //       child: Image.asset(
          //         widget.imageAddress,
          //         fit: BoxFit
          //             .cover, // This will cover the area of the aspect ratio box
          //       ),
          //     ),
          //   ),
          // ),

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
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 13),
                    decoration: BoxDecoration(
                      color: greenColorDialogue,
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
                    child: HighlightTextWidget(
                      parent: literalSections[3].description,
                      highlight: literalSections[4].description,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: const Icon(
                  Icons
                      .account_circle, // Replace with Image.asset if you have a custom image
                  size: 40,
                  color: greenColor,
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
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: _buildDragTarget(
                                firstBlank, widget.correctAnswer[0]),
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 9.0),
                              child: Text(literalSections[5].description),
                            ),
                          ),
                          WidgetSpan(
                            child: _buildDragTarget(
                                secondBlank, widget.correctAnswer[1]),
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 9.0),
                              child: Text(literalSections[6].description),
                            ),
                          ),
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
                  padding: const EdgeInsets.only(top: 18),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        Lesson lesson =
                            await loadLesson('assets/jsons/lesson1.json');
                        LessonView4 lesson1View4 = lesson.views[3];
                        String lesson1Title = lesson1View4.viewTitle;
                        String route = lesson1View4.route;
                        List soundPath = lesson1View4.soundPath;
                        int correctIndex = lesson1View4.correctAnswer;
                        List<dynamic> options = lesson1View4.options;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MultipleChoice(
                              view: lesson1View4,
                              viewTitle: lesson1Title,
                              route: route,
                              correctIndex: correctIndex,
                              soundPath: soundPath,
                              options: options,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        '繼續',
                      ),
                    ),
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
          width: 50,
          height: 50,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: isAccepting
                ? yellowColor
                : (value == null ? lightGreyColor : greenColor),
            border: Border.all(color: blackColor),
          ),
          child:
              Text(value ?? '_', style: Theme.of(context).textTheme.bodyLarge),
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
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: dragging ? transparentColor : lightBlueColor,
        border: Border.all(color: blackColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(letter,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold)),
    );
  }
}
