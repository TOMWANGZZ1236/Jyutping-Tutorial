import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('課程'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('第一堂：b,d,g,p,t,k 送氣音'),
            onTap: () {
              Navigator.pushNamed(context, '/module1-1');
            },
          ),
          ListTile(
            title: Text('Item 2'),
          ),
          ListTile(
            title: Text('Item 3'),
          ),
          ListTile(
            title: Text('Item 4'),
          ),
          ListTile(
            title: Text('Item 5'),
          ),
          ListTile(
            title: Text('Item 6'),
          ),
          ListTile(
            title: Text('Item 7'),
          ),
          ListTile(
            title: Text('Item 8'),
          ),
          ListTile(
            title: Text('Item 9'),
          ),
        ],
      ),
    );
  }
}
