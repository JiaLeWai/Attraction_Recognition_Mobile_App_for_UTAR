import 'package:flutter/material.dart';

class TianYuanDiFang extends StatelessWidget {
  const TianYuanDiFang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inviting Reception Pavilion'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/Tian Yuan Di Fang.jpg'),
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
              child: Text('The Inviting Reception Pavilion with its round dome ceiling and square floor, symbolizing heaven and earth or "Tian Yuan Di Fang 天圆地方" was built in 2009 as part of the development of the UTAR Kampar campus in Malaysia. The pavilion was designed by UTAR\'s Centre for Foundation Studies and Extension Education, with the aim of creating a unique and significant entrance to the university\'s administration building.'
                  '\n\nThe design of the pavilion was inspired by traditional Chinese architecture and philosophy. The round dome ceiling represents heaven, while the square floor represents earth. The pillars of the pavilion symbolize humans on earth. The overall structure of the pavilion embodies the Chinese philosophy of "Tian Ren He Yi" or "Unity between Man and Nature," which emphasizes the importance of balance and harmony between humans and nature.'
                  '\n\nThe Inviting Reception Pavilion has become a significant landmark within the UTAR Kampar campus, serving as a symbol of the university\'s commitment to promoting Chinese culture and values. The pavilion is often used as a venue for cultural events and performances, including Chinese New Year celebrations, lantern festivals, and traditional dance performances.',
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
