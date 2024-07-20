import 'package:flutter/material.dart';
import 'package:testapp/interface/json_interface.dart';
import 'package:testapp/views/module1_views.dart/aspirated_view.dart';

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
                Lesson lesson = await loadLesson();
                LessonView lesson1View1 = lesson.views.first;
                String lesson1Title = lesson.lessonTitle;
                // Navigator.pushNamed(context, '/module1-1');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AspiratedInitials(
                      view: lesson1View1,
                      introTitle: lesson1Title,
                    ),
                  ),
                );
              },
            ),
          ),
          // ListTile(
          //   title: Text('Item 2'),
          // ),
          // ListTile(
          //   title: Text('Item 3'),
          // ),
          // ListTile(
          //   title: Text('Item 4'),
          // ),
          // ListTile(
          //   title: Text('Item 5'),
          // ),
          // ListTile(
          //   title: Text('Item 6'),
          // ),
          // ListTile(
          //   title: Text('Item 7'),
          // ),
          // ListTile(
          //   title: Text('Item 8'),
          // ),
          // ListTile(
          //   title: Text('Item 9'),
          // ),
        ],
      ),
    );
  }
}
