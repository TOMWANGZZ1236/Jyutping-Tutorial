import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Lesson {
  final String lessonTitle;
  final List<LessonView> views;

  Lesson({required this.lessonTitle, required this.views});

  factory Lesson.fromJson(Map<String, dynamic> json) {
    //viewsJson is list of maps
    String lessonTitle = json['lessonTitle'];
    List<dynamic> viewsJson = json['views'];

    List<LessonView> views =
        viewsJson.map((view) => LessonView.fromJson(view)).toList();

    return Lesson(
      lessonTitle: lessonTitle,
      views: views,
    );
  }
}

class LessonView {
  final List<LiteralSection> literalSections;
  final List<SoundSection> soundSections;
  LessonView({required this.literalSections, required this.soundSections});

  factory LessonView.fromJson(Map<String, dynamic> json) {
    List<dynamic> literalSectionsJson = json['literalSections'];
    List<LiteralSection> literalSections = literalSectionsJson
        .map((section) => LiteralSection.fromJson(section))
        .toList();

    List<dynamic> soundSectionsJson = json['soundSections'];
    List<SoundSection> soundSections = soundSectionsJson
        .map((section) => SoundSection.fromJson(section))
        .toList();

    return LessonView(
      literalSections: literalSections,
      soundSections: soundSections,
    );
  }
}

class LiteralSection {
  final String description;
  LiteralSection({required this.description});

  factory LiteralSection.fromJson(Map<String, dynamic> json) {
    String description = json['description'];
    return LiteralSection(description: description);
  }
}

class SoundSection {
  final List<SoundElement> soundElements;

  SoundSection({required this.soundElements});

  factory SoundSection.fromJson(Map<String, dynamic> json) {
    List<dynamic> soundElementsJson = json['soundElements'];
    List<SoundElement> soundElements = soundElementsJson
        .map((element) => SoundElement.fromJson(element))
        .toList();
    return SoundSection(
      soundElements: soundElements,
    );
  }
}

class SoundElement {
  final String text;
  final String soundPath;
  final String alphaText;

  SoundElement(
      {required this.text, required this.soundPath, required this.alphaText});

  factory SoundElement.fromJson(Map<String, dynamic> json) {
    String text = json['text'];
    String soundPath = json['soundPath'];
    String alphaText = json['alphaText'];

    return SoundElement(
      text: text,
      soundPath: soundPath,
      alphaText: alphaText,
    );
  }
}

Future<Lesson> loadLesson() async {
  //Get the asset/data.json as string
  String data = await rootBundle.loadString('assets/jsons/lesson1.json');

  //Convert String into Dart
  final jsonResult = jsonDecode(data);
  return Lesson.fromJson(jsonResult);
}
