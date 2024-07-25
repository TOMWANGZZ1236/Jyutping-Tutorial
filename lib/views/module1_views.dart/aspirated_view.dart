import 'package:flutter/material.dart';
import 'package:testapp/interface/json_interface.dart';
import 'package:testapp/widgets.dart/text_with_sound_icon.dart';
import 'package:testapp/widgets.dart/back_main.dart';

class AspiratedInitials extends StatefulWidget {
  final LessonView view;
  final String introTitle;
  const AspiratedInitials(
      {super.key, required this.view, required this.introTitle});

  @override
  State<AspiratedInitials> createState() => _AspiratedInitialsState();
}

class _AspiratedInitialsState extends State<AspiratedInitials> {
  late final List<LiteralSection> literalSections;
  late final List<SoundSection> soundSections;
  late final List<bool> checkboxStates2;
  late final List<bool> checkboxStates1;

  @override
  initState() {
    literalSections = widget.view.literalSections;
    soundSections = widget.view.soundSections;
    checkboxStates2 = [
      false,
      false,
      false,
    ];
    checkboxStates1 = [
      false,
      false,
      false,
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.introTitle,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
          actions: <Widget>[
            CustomExitIconButton(
              context: context,
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(literalSections[0].description,
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(literalSections[1].description,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(literalSections[2].description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...soundSections[0].soundElements.asMap().entries.map(
                      (soundElement) => TextWithSoundIcon(
                        text: soundElement.value.text,
                        soundPath: soundElement.value.soundPath,
                        alphaText: soundElement.value.alphaText,
                        onActivated: (activated) {
                          setState(() {
                            checkboxStates1[soundElement.key] = activated;
                          });
                        },
                        width: 30,
                        height: 30,
                        fontWeight: false,
                      ),
                    )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(literalSections[3].description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...soundSections[1].soundElements.asMap().entries.map(
                      (soundElement) => TextWithSoundIcon(
                        text: soundElement.value.text,
                        soundPath: soundElement.value.soundPath,
                        alphaText: soundElement.value.alphaText,
                        onActivated: (activated) {
                          setState(() {
                            checkboxStates2[soundElement.key] = activated;
                          });
                        },
                        width: 30,
                        height: 30,
                        fontWeight: false,
                      ),
                    )
              ],
            ),
            const SizedBox(height: 25.0),
            if (checkboxStates1.every((state) => state) &&
                checkboxStates2.every(
                    (state) => state)) // Check if all checkboxes are activated
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/module1-2');
                },
                child: const Text('繼續'),
              ),
          ],
        ));
  }
}
