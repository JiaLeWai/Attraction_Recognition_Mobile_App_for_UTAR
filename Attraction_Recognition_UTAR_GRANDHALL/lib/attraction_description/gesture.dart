import 'package:flutter/material.dart';

class gesture extends StatelessWidget {
  const gesture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The Gesture'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/bamboo.jpeg'),
              width: 400,
              height: 400,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Description',
              style: TextStyle(fontSize: 40),
            ),
            Text('- - - - - - - - - - - - - - - - - - - - - - - - - - - -',
              style: TextStyle(fontSize: 15),
            ),

            Container(
              padding: EdgeInsets.all(20),
              child: Text('The GESTURE is a bamboo pavillion signifying UTAR\'s commitment towards sustainability for the good of future generations. It is an elegant design which reaches out and connects with nature and its surrounding, with a scenic view of the grand and vast lake of UTAR Kampar campus'
                  '\n\nThe traditional weaving and out-reaching form of The GESTURE is grand yet humble in stature. It symbolizes the essence of living - wearving and overcoming challenges in life while always reminding us of our roots and cultural values.'
                  '\n\nThe bamboo, with which The GESTURE is a constructed, is among the greenest of gifts from nature and has been part of many civilizations for centuries.'
                  '\n\nThe GESTURE is a design which will remind us not to separate ourselves from nature and our cultural roots.'
                  '\n\nThe GESTURE won First Place (Comprehensive Expression) and Second Place (Architectural Design) at Malaysia Level and Second Place at the ASEAN Level Competition for the Gunagdong-Hong Kong-Macau Greater Bay Area - ASEAN International Colleges Design and Construction of Bamboo Competiton 2020.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
