import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:testapp/constants/theme_constants.dart';
import 'package:testapp/widgets.dart/TextWithSoundIcon.dart';
import 'package:testapp/widgets.dart/back_main.dart';

class AspiratedInitials extends StatefulWidget {
  const AspiratedInitials({super.key});

  @override
  State<AspiratedInitials> createState() => _AspiratedInitialsState();
}

class _AspiratedInitialsState extends State<AspiratedInitials> {
  List<bool> checkboxStates = [
    false,
    false,
    false,
    false,
    false,
    false
  ]; // Track checkbox states
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('送氣音💨💨'),
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
              child: Text('\n➡️ p, t, k 有很強的噴氣；\n➡️ b, d, g 不噴氣，也不震動聲帶。\n',
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text('請跟著下面的發音，感受一下送氣的感覺\n',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('❌送氣🤐：',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextWithSoundIcon(
                  text: "百",
                  soundPath: 'sound/baat3.mp3',
                  alphaText: 'b',
                  onActivated: (activated) {
                    setState(() {
                      checkboxStates[0] = activated;
                    });
                  },
                  width: 30,
                  height: 30,
                  fontWeight: false,
                ),
                TextWithSoundIcon(
                  text: "島",
                  soundPath: "sound/dou2.mp3",
                  alphaText: 'd',
                  onActivated: (activated) {
                    setState(() {
                      checkboxStates[1] = activated;
                    });
                  },
                  width: 30,
                  height: 30,
                  fontWeight: false,
                ),
                TextWithSoundIcon(
                  text: "家",
                  soundPath: "sound/gaa1.mp3",
                  alphaText: 'g',
                  onActivated: (activated) {
                    setState(() {
                      checkboxStates[2] = activated;
                    });
                  },
                  width: 30,
                  height: 30,
                  fontWeight: false,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('送氣💨：',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextWithSoundIcon(
                  text: "拍",
                  soundPath: "sound/paak3.mp3",
                  alphaText: 'p',
                  onActivated: (activated) {
                    setState(() {
                      checkboxStates[3] = activated;
                    });
                  },
                  width: 30,
                  height: 30,
                  fontWeight: false,
                ),
                TextWithSoundIcon(
                  text: "土",
                  soundPath: "sound/tou2.mp3",
                  alphaText: 't',
                  onActivated: (activated) {
                    setState(() {
                      checkboxStates[4] = activated;
                    });
                  },
                  width: 30,
                  height: 30,
                  fontWeight: false,
                ),
                TextWithSoundIcon(
                  text: "卡",
                  soundPath: "sound/kaa1.mp3",
                  alphaText: 'k',
                  onActivated: (activated) {
                    setState(() {
                      checkboxStates[5] = activated;
                    });
                  },
                  width: 30,
                  height: 30,
                  fontWeight: false,
                ),
              ],
            ),
            const SizedBox(height: 25.0),
            if (checkboxStates.every(
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
