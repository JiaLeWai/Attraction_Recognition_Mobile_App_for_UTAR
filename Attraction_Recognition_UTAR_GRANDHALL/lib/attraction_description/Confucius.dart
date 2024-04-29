import 'package:flutter/material.dart';

class confucius extends StatelessWidget {
  const confucius({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Confucius'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/confucius.jpg'),
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
              child: Text('The Confucius statue measures 183 cm tall, 82 cm wide and 100 cm long and weighs 300 kg;',
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
