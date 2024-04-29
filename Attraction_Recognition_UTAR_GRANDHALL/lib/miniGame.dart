import 'dart:math';
import 'package:flutter/material.dart';
import 'dummyAttraction.dart';

class MiniGame extends StatefulWidget {
  @override
  _MiniGameState createState() => _MiniGameState();
}

class _MiniGameState extends State<MiniGame> {
  int randomIndex = 0;
  Data data = Data();

  void showRandomAttraction() {
    setState(() {
      randomIndex = Random().nextInt(data.allattraction.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Attraction'),
      ),
      body: SingleChildScrollView(
      child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: showRandomAttraction,
              child: Text('Show Random Attraction'),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                data.allattraction[randomIndex]['name'],
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Image.asset(
                data.allattraction[randomIndex]['image'],
                width: 300,
                height: 300,
              ),
            ),
            SizedBox(height: 16),
            Text(
              data.allattraction[randomIndex]['description'],
              textAlign: TextAlign.justify,

            ),
            SizedBox(height: 32),

          ],
        ),
      ),
      ),
    );
  }
}