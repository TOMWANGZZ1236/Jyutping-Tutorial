import 'package:flutter/material.dart';

class HighlightTextWidget extends StatelessWidget {
  final String parent;
  final String highlight;
  final TextStyle? textStyle;
  final TextStyle? highlightStyle;

  HighlightTextWidget({
    required this.parent,
    required this.highlight,
    this.textStyle,
    this.highlightStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle defaultTextStyle =
        textStyle ?? Theme.of(context).textTheme.bodyMedium!;
    TextStyle defaultHighlightStyle = highlightStyle ??
        defaultTextStyle.copyWith(fontWeight: FontWeight.bold);

    List<TextSpan> spans = [];

    int start = 0;
    int foundIndex = parent.indexOf(highlight);
    while (foundIndex != -1) {
      // Add non-highlighted text
      if (foundIndex > start) {
        spans.add(TextSpan(
          text: parent.substring(start, foundIndex),
          style: defaultTextStyle,
        ));
      }

      // Add highlighted text
      spans.add(TextSpan(
        text: parent.substring(foundIndex, foundIndex + highlight.length),
        style: defaultHighlightStyle,
      ));

      // Update the start index to end of the last highlighted section
      start = foundIndex + highlight.length;

      // Look for the next occurrence of the highlight string
      foundIndex = parent.indexOf(highlight, start);
    }

    // Add any remaining text after the last highlight
    if (start < parent.length) {
      spans.add(TextSpan(
        text: parent.substring(start),
        style: defaultTextStyle,
      ));
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }
}
