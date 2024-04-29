import 'package:flutter/material.dart';

class inkblock extends StatelessWidget {
  const inkblock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ink Block'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/ink_block.jpg'),
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
              child: Text('Ink blocks, emblazoned with Chinese characters, each block representing one of the Six Educational Pillars of UTAR education. It was inspired by the traditional Chinese ink block.'
                  'Virtue and Morality  德, Knowledge and Intellect  智, Physical and Mental Health  体, Sociality and Humanitarianism  群, Aesthetics and Harmony  美, Creativity and Innovation  新  '
                  "\n\nThe building features a distinctive black facade and is shaped like a giant ink block, with several floors stacked on top of each other. The design was chosen to symbolize the university\'s commitment to education and to pay homage to the art of calligraphy, which is highly valued in Chinese culture.",
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
