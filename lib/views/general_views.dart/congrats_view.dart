import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:testapp/widgets.dart/back_main.dart';

class CelebrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("恭喜！"),
        actions: <Widget>[
          CustomExitIconButton(
            context: context,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              'assets/lottie/celebration.json', // Ensure this file is in your assets folder
              repeat: true,
              animate: true,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '恭喜晒！你已經完成第一堂課！',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Adjust based on your navigation needs
              },
              child: Text('繼續'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
