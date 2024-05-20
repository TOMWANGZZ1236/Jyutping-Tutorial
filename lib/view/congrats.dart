import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CelebrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Congratulations!"),
        backgroundColor: Colors.green,
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
