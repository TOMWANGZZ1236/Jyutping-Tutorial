import 'package:flutter/material.dart';
import 'package:testapp/interface/interface_p1.dart';
import 'package:testapp/interface/lesson_interface.dart';
import 'package:testapp/views/lessons_specific.dart/module1_views.dart/aspirated_view.dart';
import 'package:testapp/views/lessons_specific.dart/module2_views.dart/initial_consonant_view.dart';

class SyllabusPage extends StatefulWidget {
  const SyllabusPage({super.key});

  @override
  State<SyllabusPage> createState() => _SyllabusPageState();
}

class _SyllabusPageState extends State<SyllabusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('所有課程'),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade400, // Use a light grey background
              border: Border.all(
                  color: Colors.grey.shade400,
                  width: 1), // Slightly darker grey border
            ),
            child: ListTile(
              title: Text('第一堂：b,d,g,p,t,k 送氣音',
                  style: Theme.of(context).textTheme.bodyMedium),
              onTap: () async {
                // print('happy');
                Lesson lesson = await loadLesson('assets/jsons/lesson1.json');
                print('happy1');
                LessonView lesson1View1 = lesson.views.first;
                String lesson1Title = lesson1View1.viewTitle;
                String route = lesson1View1.route;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AspiratedInitials(
                      view: lesson1View1,
                      introTitle: lesson1Title,
                      route: route,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade400, // Use a light grey background
              border: Border.all(
                  color: Colors.grey.shade400,
                  width: 1), // Slightly darker grey border
            ),
            child: ListTile(
              title: Text('第二堂：z,c,s 聲母',
                  style: Theme.of(context).textTheme.bodyMedium),
              onTap: () async {
                Lesson lesson = await loadLesson('assets/jsons/lesson2.json');
                LessonView lesson2View1 = lesson.views.first;
                String lesson2Title = lesson2View1.viewTitle;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InitialConsonant(
                      view: lesson2View1,
                      introTitle: lesson2Title,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
