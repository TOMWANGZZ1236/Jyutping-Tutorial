class MatchingView {
  final List<LiteralSection> literalSections;
  final List<SoundSection> soundSections;
  final Map<String, dynamic> matched;
  final String route;
  final String viewTitle;
  final List<dynamic> alphaText;

  MatchingView({
    required this.alphaText,
    required this.route,
    required this.viewTitle,
    required this.matched,
    required this.literalSections,
    required this.soundSections,
  });

  factory MatchingView.fromJson(Map<String, dynamic> json) {
    List<dynamic> literalSectionsJson = json['literalSections'];
    List<LiteralSection> literalSections = literalSectionsJson
        .map((section) => LiteralSection.fromJson(section))
        .toList();

    List<dynamic> soundSectionsJson = json['soundSections'];
    List<SoundSection> soundSections = soundSectionsJson
        .map((section) => SoundSection.fromJson(section))
        .toList();
    Map<String, dynamic> matched = json['matched'];
    String route = json["route"].toString();
    String viewTitle = json["viewTitle"].toString();
    List<dynamic> alphaText = json["alphaText"];
    return MatchingView(
      literalSections: literalSections,
      soundSections: soundSections,
      matched: matched,
      route: route,
      viewTitle: viewTitle,
      alphaText: alphaText,
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
