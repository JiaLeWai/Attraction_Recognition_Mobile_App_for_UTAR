import 'package:flutter/material.dart';

class main_entrance extends StatelessWidget {
  const main_entrance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Entrance'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/main_entrance.jpg'),
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
              child: Text('The Main Entrance of Dewan Tun Dr Ling Liong Sik, UTAR Kampar. Dewan Tun Dr Ling Liong Sik is a large multipurpose hall located on the UTAR Kampar campus in Malaysia. It is named after the former Malaysian Minister of Transport, Tun Dr Ling Liong Sik, and can accommodate a significant number of people for various events such as lectures, seminars, exhibitions, and performances.',
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
