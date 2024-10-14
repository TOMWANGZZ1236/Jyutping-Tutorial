import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:testapp/interface/interface_p1.dart';
import 'package:testapp/interface/interface_p2.dart';
import 'package:testapp/interface/interface_p3.dart';
import 'package:testapp/interface/interface_p4.dart';

class Lesson {
  final List<dynamic> views;

  Lesson({required this.views});

  factory Lesson.fromJson(Map<String, dynamic> json) {
    List<dynamic> viewsJson = json['views'];

    List<dynamic> views = [
      LessonView.fromJson(viewsJson[0]),
      LessonView2.fromJson(viewsJson[1]),
      LessonView3.fromJson(viewsJson[2]),
      LessonView4.fromJson(viewsJson[3])
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
