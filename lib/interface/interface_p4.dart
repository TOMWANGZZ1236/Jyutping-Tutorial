class LessonView4 {
  final List<LiteralSection> literalSections;
  final String route;
  final String viewTitle;
  final List soundPath;
  final int correctAnswer;
  final List<dynamic> options;
  final List<SoundSection> soundSections;

  LessonView4({
    required this.options,
    required this.correctAnswer,
    required this.route,
    required this.viewTitle,
    required this.literalSections,
    required this.soundSections,
    required this.soundPath,
  });

  factory LessonView4.fromJson(Map<String, dynamic> json) {
    List<dynamic> literalSectionsJson = json['literalSections'];
    List<dynamic> soundSectionsJson = json['soundSections'];
    List<SoundSection> soundSections = soundSectionsJson
        .map((section) => SoundSection.fromJson(section))
        .toList();
    List<dynamic> options = json['options'];
    List<LiteralSection> literalSections = literalSectionsJson
        .map((section) => LiteralSection.fromJson(section))
        .toList();

    int correctAnswer = json["correctAnswer"];
    String route = json["route"].toString();
    String viewTitle = json["viewTitle"].toString();
    List soundPath = json["soundPath"];
    return LessonView4(
      literalSections: literalSections,
      route: route,
      viewTitle: viewTitle,
      correctAnswer: correctAnswer,
      options: options,
      soundPath: soundPath,
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
  final List<dynamic> soundPath;
  final String alphaText;

  SoundElement(
      {required this.text, required this.soundPath, required this.alphaText});

  factory SoundElement.fromJson(Map<String, dynamic> json) {
    String text = json['text'];
    List<dynamic> soundPath = json['soundPath'];
    String alphaText = json['alphaText'];

    return SoundElement(
      text: text,
      soundPath: soundPath,
      alphaText: alphaText,
    );
  }
}
