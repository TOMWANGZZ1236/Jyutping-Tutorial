import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:testapp/interface/tutorial_interface.dart';
import 'package:testapp/interface/matching_interface.dart';
import 'package:testapp/interface/dragdrop_interface.dart';
import 'package:testapp/interface/multiplechoice_interface.dart';

class Lesson {
  final List<dynamic> views;

  Lesson({required this.views});

  factory Lesson.fromJson(Map<String, dynamic> json) {
    List<dynamic> viewsJson = json['views'];

    List<dynamic> views = [
      LessonView.fromJson(viewsJson[0]),
      MatchingView.fromJson(viewsJson[1]),
      MatchingView.fromJson(viewsJson[2]),
      MatchingView.fromJson(viewsJson[3]),
      LessonView3.fromJson(viewsJson[4]),
      LessonView4.fromJson(viewsJson[5])
    ];

    return Lesson(
      views: views,
    );
  }
}

Future<Lesson> loadLesson(String lesson) async {
  //Get the asset/data.json as string
  String data = await rootBundle.loadString(lesson);

  //Convert String into Dart
  final jsonResult = jsonDecode(data);
  return Lesson.fromJson(jsonResult);
}
