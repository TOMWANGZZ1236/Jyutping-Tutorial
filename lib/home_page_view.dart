import 'package:flutter/material.dart';

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
        title: const Text("粵拼教學"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('\n點dim2 解gaai2 要jiu3 學hok6 粵jyut6 拼ping3?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                  '漢 字 非 拼 音 文 字 ，需 要 一 個 拼 音 方 案 嚟 準 確 表 示 粵 語 嘅 發 音。\n\n'
                  '學 識 粵 拼 可 以 幫 助 糾 正 懶 音 錯 音，規 範 自 己 嘅 粵 語 口 音。\n\n'
                  '學 普 通 話 要 學 普 通 話 拼 音，學 粵 語 就 要 學 粵 拼。\n\n'
                  '學 識 粵 拼 ，可 以 用 粵 拼 輸 入 法 嚟 打 粵 語 ，作 爲 最 自 然 簡 單 嘅 打 字 方 式',
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/syllabus-route');
              },
              child: const Text(
                '撳掣開始粵拼學習',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
