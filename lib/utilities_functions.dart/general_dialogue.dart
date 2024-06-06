import 'package:flutter/material.dart';
import 'package:testapp/constants/theme_constants.dart';

void showCustomDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String option1,
  required String option2,
  required VoidCallback confirmAction,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              option1,
            ),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                  horizontal: 15.0, vertical: 10.0), // Text color
              backgroundColor: blueColor, // Button background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: const BorderSide(color: blueColor), // Border color
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              confirmAction(); // Execute the confirm action
            },
            child: Text(
              option2,
            ),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                  horizontal: 15.0, vertical: 10.0), // Text color
              backgroundColor: blueColor, // Button background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: const BorderSide(color: blueColor), // Border color
              ),
            ),
          ),
        ],
      );
    },
  );
}
