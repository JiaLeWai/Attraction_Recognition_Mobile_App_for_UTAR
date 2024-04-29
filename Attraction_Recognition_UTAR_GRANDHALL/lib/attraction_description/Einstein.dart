import 'package:flutter/material.dart';

class einstein extends StatelessWidget {
  const einstein({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Einstein'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/einstein.jpg'),
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
              child: Text('Einstein statue measures 168 cm tall, 76 cm wide and 119 cm long and weighs 280 kg',
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
