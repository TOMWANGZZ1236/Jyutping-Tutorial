class LessonView3 {
  final List<LiteralSection> literalSections;
  final String route;
  final String viewTitle;
  final List<dynamic> correctAnswer;
  final List<dynamic> draggables;

  LessonView3({
    required this.draggables,
    required this.correctAnswer,
    required this.route,
    required this.viewTitle,
    required this.literalSections,
  });

  factory LessonView3.fromJson(Map<String, dynamic> json) {
    List<dynamic> literalSectionsJson = json['literalSections'];
    List<LiteralSection> literalSections = literalSectionsJson
        .map((section) => LiteralSection.fromJson(section))
        .toList();

    List<dynamic> draggables = json['draggables'];
    List<dynamic> alphaText = json["correctAnswer"];
    String route = json["route"].toString();
    String viewTitle = json["viewTitle"].toString();

    return LessonView3(
      literalSections: literalSections,
      route: route,
      viewTitle: viewTitle,
      correctAnswer: alphaText,
      draggables: draggables,
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
