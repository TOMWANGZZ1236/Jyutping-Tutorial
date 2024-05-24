import 'package:flutter/material.dart';
import 'package:testapp/constants.dart';
import 'package:testapp/view/Aspirated.dart';
import 'package:testapp/view/MatchingWord.dart';
import 'package:testapp/view/congrats.dart';
import 'package:testapp/view/dialogue.dart';
import 'package:testapp/view/introView.dart';
import 'package:testapp/view/mcquestions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Introduction',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: MultipleChoiceTest(
        //   word: '冬',
        //   options: ['d', 'k', 'b', 't'],
        //   correctIndex: 0,
        //   imageAddress: 'assets/images/winter.jpg',
        //   route: '/module1-9',
        // ),
        home: const MyHomePage(title: '粵拼教學'),
        routes: {
          '/intro-route': (context) => const IntroPage(),
          '/module1-1': (context) => const AspiratedInitials(),
          '/module1-2': (context) => matchingGameBP,
          '/module1-3': (context) => matchingGameDT,
          '/module1-4': (context) => matchingGameGK,
          '/module1-5': (context) => dialogue1,
          '/module1-6': (context) => dialogue2,
          '/module1-7': (context) => dialogue3,
          '/module1-8': (context) => mc1,
          '/module1-9': (context) => mc2,
          '/module1-10': (context) => mc3,
          '/module1-11': (context) => mc4,
          '/module1-12': (context) => mc5,
          '/module1-13': (context) => mc6,
          '/module1-14': (context) => CelebrationPage(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('\n點dim2 解gaai2 要jiu3 學hok6 粵jyut6 拼ping3?',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            const Padding(
              padding: EdgeInsets.all(40.0),
              child: Text(
                  '漢 字 非 拼 音 文 字 ，需 要 一 個 拼 音 方 案 嚟 準 確 表 示 粵 語 嘅 發 音。\n\n'
                  '學 識 粵 拼 可 以 幫 助 糾 正 懶 音 錯 音，規 範 自 己 嘅 粵 語 口 音。\n\n'
                  '學 普 通 話 要 學 普 通 話 拼 音，學 粵 語 就 要 學 粵 拼。\n\n'
                  '學 識 粵 拼 ，可 以 用 粵 拼 輸 入 法 嚟 打 粵 語 ，作 爲 最 自 然 簡 單 嘅 打 字 方 式',
                  style: const TextStyle(fontSize: 15)),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/intro-route');
                },
                child: const Text('撳掣開始粵拼學習'))
          ],
        ),
      ),
    );
  }
}
