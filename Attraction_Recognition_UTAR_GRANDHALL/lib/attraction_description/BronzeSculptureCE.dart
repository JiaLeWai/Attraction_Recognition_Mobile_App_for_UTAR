import 'package:flutter/material.dart';

class CE extends StatelessWidget {
  const CE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bronze Sculpture of Confucius and Einstein'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/test.jpg'),
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
              child: Text('The bronze sculptures of Confucius and Einstein are the pride of Universiti Tunku Abdul Rahman (UTAR). Located at the open space in front of the Heritage Hall Building in UTAR Kampar Campus, the sculptures symbolise the Universality of Learning and Thinking with the convergence of wisdoms from both the East and the West. The bronze sculptures of Confucius and Einstein depict two world renowned scholars from two different eras and cultures – an eminent philosopher from the East and a genius physicist from the West – seated facing each other pondering the next move in the mind-challenging game of chess. The Confucius statue measures 183 cm tall, 82 cm wide and 100 cm long and weighs 300 kg; while the Einstein statue measures 168 cm tall, 76 cm wide and 119 cm long and weighs 280 kg. Located in between the two statues is the chessboard that weights 120 kg, 76 cm tall, 91 cm wide and 91 cm long. The statues are seated on a 46 cm tall, 147 cm wide and 800 cm long pedestal. The inscription on the plaque depicts a profound message',
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
