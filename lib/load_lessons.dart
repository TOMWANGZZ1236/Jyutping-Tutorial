import 'package:testapp/interface/tutorial_interface.dart';
import 'package:testapp/interface/matching_interface.dart'
    hide LiteralSection, SoundSection;
import 'package:testapp/interface/dragdrop_interface.dart';
import 'package:testapp/interface/multiplechoice_interface.dart';
import 'package:testapp/interface/lesson_interface.dart';
import 'package:testapp/views/general_views.dart/dialogue_view.dart';
import 'package:testapp/views/general_views.dart/matching_word_view.dart';
import 'package:testapp/views/general_views.dart/mcquestions_view.dart';
import 'package:testapp/views/lessons_specific.dart/module1_views.dart/aspirated_view.dart';

loadLessons(String assetPath) async {
  List<dynamic> exerciseList = [];
  Lesson lesson = await loadLesson(assetPath);

  //Tutorial itself
  LessonView lesson1View1 = lesson.views.first;
  String lesson1View1Title = lesson1View1.viewTitle;
  String route1 = lesson1View1.route;

  AspiratedInitials v1 = AspiratedInitials(
    view: lesson1View1,
    introTitle: lesson1View1Title,
    route: route1,
  );
  exerciseList.add(v1);

  //Matching view
  for (int i = 1; i < 4; i++) {
    MatchingView lesson1View2 = lesson.views[i];
    String lesson1View2Title = lesson1View2.viewTitle;
    String route2 = lesson1View2.route;
    Map<String, dynamic> matched = lesson1View2.matched;
    List<dynamic> alphaText = lesson1View2.alphaText;
    MatchingGame v2 = MatchingGame(
      view: lesson1View2,
      introTitle: lesson1View2Title,
      route: route2,
      matched: matched,
      alphaText: alphaText,
    );
    exerciseList.add(v2);
  }

  //Fill in blanks
  LessonView3 lesson1View3 = lesson.views[4];
  String lesson1View3Title = lesson1View3.viewTitle;
  String route3 = lesson1View3.route;
  List<dynamic> draggables = lesson1View3.draggables;
  List<dynamic> correctAnswer = lesson1View3.correctAnswer;
  FillInTheBlanks v3 = FillInTheBlanks(
    view: lesson1View3,
    introTitle: lesson1View3Title,
    route: route3,
    draggables: draggables,
    correctAnswer: correctAnswer,
  );
  exerciseList.add(v3);

  //Multiple Choices
  LessonView4 lesson1View4 = lesson.views[5];
  String lesson1View4Title = lesson1View4.viewTitle;
  String route4 = lesson1View4.route;
  List soundPath = lesson1View4.soundPath;
  int correctIndex = lesson1View4.correctAnswer;
  List<dynamic> options = lesson1View4.options;
  MultipleChoice v4 = MultipleChoice(
    view: lesson1View4,
    viewTitle: lesson1View4Title,
    route: route4,
    correctIndex: correctIndex,
    soundPath: soundPath,
    options: options,
  );
  exerciseList.add(v4);

  return exerciseList;
}
