import 'package:flutter/material.dart';
import 'package:testapp/utilities_functions.dart/general_dialogue.dart';

class CustomExitIconButton extends StatelessWidget {
  final BuildContext context;

  const CustomExitIconButton({Key? key, required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: () => showCustomDialog(
        context: context,
        title: "返回主頁面",
        content: "你確定想要返回主頁面嗎？這將可能丟失所有的進度！",
        confirmAction: () => Navigator.of(context).pushNamed('/syllabus-route'),
        option1: '再多考慮',
        option2: '去意已決',
      ),
    );
  }
}
